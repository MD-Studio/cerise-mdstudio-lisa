FROM mdstudio/cerise-mdstudio-base:0.3.3

COPY api /home/cerise/api
RUN chown -R cerise:cerise /home/cerise/api

COPY known_hosts /home/cerise/.ssh/
RUN chown -R cerise:cerise /home/cerise/.ssh/known_hosts
