require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = 'XEkEFTRLILyEYTuOZs1b9oFp4' # Your app consumer key
    self.consumer_secret = 'wPpsIfFsZFg92XepcD3kNCSHlmBKoMBzp9jBoK8ag7WJ2JYbLM' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '1h' do
      model = Ebooks::Model.load("model/cubanfionaapple.model")  
      tweet(model.make_statement(140))

    end
  end

  def on_message(dm)
    # Reply to a DM
    # reply(dm, "secret secrets")
  end

  def on_follow(user)
    # Follow a user back
    # follow(user.screen_name)
  end

  def on_mention(tweet)
    model = Ebooks::Model.load("model/cubanfionaapple.model")  
    reply(tweet, model.make_statement(140))
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end

  def on_retweet(tweet)
    # Follow user who just retweeted bot's tweet
    # follow(tweet.user.screen_name)
  end
end

# Make a MyBot and attach it to an account
MyBot.new("quintybot") do |bot|
  bot.access_token = "897973893440434176-hmqqmnNIcJDWT5hPgDknHMOCxwguGdw" # Token connecting the app to this account
  bot.access_token_secret = "DxoXvmlWCaOm6BuRVgDvR6lNjQvql48yte3wHBr3sihuU" # Secret connecting the app to this account
end
