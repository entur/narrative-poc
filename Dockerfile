# Welcome to this silly little example!
# Here we abuse nginx to behave as we expect, following the Golden Path
# 
# You may notice the two health check enpoints. 
# These are the default endpoint expected by our common chart with no config
# 
# Check the DevOps Handbook for instruction for how to author an amazing Dockerfile
FROM nginx:alpine

# A custom nginx config with probes
RUN printf 'server { \n\
    listen        8080; \n\
    server_name   localhost; \n\
    location /actuator/health/readiness { \n\
        default_type text/plain; \n\
        add_header Content-Type text/plain; \n\
        return 200 "ready"; \n\
    } \n\
    location /actuator/health/liveness { \n\
        default_type text/plain; \n\
        add_header Content-Type text/plain; \n\
        return 200 "alive"; \n\
    } \n\
    location / { \n\
        default_type text/plain; \n\
        add_header Content-Type text/plain; \n\
        return 200 "Hello World"; \n\
    } \n\
}' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
# USER nginx # this is handled by the nginx itself, proc started as `nginx` user
