class Comment

  attr_reader :id, :comment, :tweet_id

  def initialize(id:, comment:, tweet_id:)
    @id = id
    @comment = comment
    @tweet_id = tweet_id
  end

  def self.create(tweet_id:, comment:)
    result = DatabaseConnection.query("INSERT INTO comments (tweet_id, comment) VALUES ('#{tweet_id}','#{comment}') RETURNING id, comment, tweet_id;")
    Comment.new(
      id: result[0][0],
      comment: result[0][1],
      tweet_id: result[0][2]
    )
  end

  def self.all_for_this_tweet(tweet_id:)
    all_comments = []
    result = DatabaseConnection.query("SELECT * FROM comments WHERE tweet_id = #{tweet_id};")
    result.each do |comment|
      all_comments << [comment[0], comment[1], comment[2]]
    end
    all_comments
  end

  def self.where(tweet_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE tweet_id = #{tweet_id};")
    result.map do |comment|
      Comment.new(
        id: comment[0],
        comment: comment[1],
        tweet_id: comment[2]
      )
    end
  end

  def self.delete(tweet_id:)
    DatabaseConnection.query("DELETE FROM comments WHERE tweet_id = #{tweet_id}")
  end

end