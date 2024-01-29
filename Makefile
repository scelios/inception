# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: beaudibe <beaudibe@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/07 20:48:20 by beaudibe          #+#    #+#              #
#    Updated: 2024/01/29 17:32:59 by beaudibe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Define variables for ANSI escape codes.
GREEN := \033[0;32m
RED   := \033[0;41m
NC := \033[0m

# Beginning of makefile variables.
.PHONY: help delete-image build up start down destroy stop restart logs logs-app ps login-server login-app login-db mysql-db delete-all

THIS_FILE 	:= $(lastword $(MAKEFILE_LIST))
SERVER		=  nginx
APP			=  wordpress
DATABASE	=  db
YML_DIR		=  ./srcs

# Beginning of makefile rules.
init: 
		@mkdir -p ${HOME}/beaudibe/data/wordpress_code/
		@mkdir -p ${HOME}/beaudibe/data/wordpress_db/
		@echo "${GREEN}directories created successfully for wordpress db/code ...${NC}"
		
help:
		@make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
build:
		docker-compose -f ${YML_DIR}/docker-compose.yml build $(c)
		@echo "${GREEN}build finished.${NC}"
up:		build
		docker-compose -f ${YML_DIR}/docker-compose.yml up $(c)
		@echo "${GREEN}containers UP in -detach mode ...${NC}"
start:
		docker-compose -f ${YML_DIR}/docker-compose.yml start $(c)
down:
		docker-compose -f ${YML_DIR}/docker-compose.yml down $(c)
		@echo "${RED}containers are down${NC}"
destroy:
		docker-compose -f ${YML_DIR}/docker-compose.yml down -v $(c)
		@echo "${RED}destroying containers and volumes (not equivalent to delete- rules) ...${NC}"
stop:
		docker-compose -f ${YML_DIR}/docker-compose.yml stop $(c)
restart:
		docker-compose -f ${YML_DIR}/docker-compose.yml stop $(c)
		docker-compose -f ${YML_DIR}/docker-compose.yml up -d $(c)
logs:
		docker-compose -f ${YML_DIR}/docker-compose.yml logs --tail=100 -f $(c)
logs-app:
		docker-compose -f ${YML_DIR}/docker-compose.yml logs --tail=100 -f ${APP}
ps:
		docker-compose -f ${YML_DIR}/docker-compose.yml ps
login-server:
		docker-compose -f ${YML_DIR}/docker-compose.yml exec ${SERVER} /bin/bash
login-app:
		docker-compose -f ${YML_DIR}/docker-compose.yml exec ${APP} /bin/bash
login-db:
		docker-compose -f ${YML_DIR}/docker-compose.yml exec ${DATABASE} /bin/bash
mysql-db:
		docker-compose -f ${YML_DIR}/docker-compose.yml exec ${DATABASE} mysql --host=localhost

delete-db:
		@rm -rf ~/${HOME}/beaudibe/data/wordpress_db/*
		@echo "${GREEN}database volume content deleted successfully ...${NC}"
delete-code:
		@rm -rf ~/${HOME}/beaudibe/data/wordpress_code/*
		@echo "${GREEN}code volume content deleted successfully ...${NC}"
		
delimgs: destroy
		docker rmi $$(docker images -q)
		@echo "${RED}images deleted ...${NC}"

delete-all: delimgs delete-db delete-code
		@echo "${RED}all volumes and images deleted ...${NC}"
		
		