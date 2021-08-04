require 'comment'
require 'tweet'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      tweet = Tweet.create(tweet: "Tweet to be commented on")
      comment = Comment.create(comment: "This is a comment", tweet_id: tweet.id)

      persisted_data = SQLite3::Database.new "twitter_test.db"
      comments = persisted_data.execute("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(comment).to be_a(Comment)
      expect(comment.id).to eq(comments.first[0])
      expect(comment.comment).to eq('This is a comment')
      expect(comment.tweet_id).to eq(tweet.id)
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      tweet = Tweet.create(tweet: "Tweet to be commented on")
      comment = Comment.create(comment: "This is a comment 1", tweet_id: tweet.id)
      Comment.create(comment: "This is a comment 2", tweet_id: tweet.id)

      all_comments = Comment.where(tweet_id: tweet.id)
      comment = all_comments.first
      persisted_data = SQLite3::Database.new "twitter_test.db"
      db_comments = persisted_data.execute("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(all_comments.length).to eq(2)
      expect(comment.id).to eq(db_comments.first[0])
      expect(comment.comment).to eq('This is a comment 1')
      expect(comment.tweet_id).to eq(tweet.id)
    end
  end
end