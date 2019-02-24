FROM rails_vim:foreman
RUN mkdir /ik
WORKDIR /ik
COPY Gemfile /ik/Gemfile
COPY Gemfile.lock /ik/Gemfile.lock

COPY . /ik/
RUN bundle install
# Script to run at container start
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 5000
EXPOSE 3035
# start main process
CMD ["rails", "server", "-b", "0.0.0.0"]

