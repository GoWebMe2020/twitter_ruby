import React, { useState, useEffect, useRef } from "react";
import TweetForm from "./TweetForm/TweetForm";
import "./Feed.css";
import CommentForm from "./CommentForm/CommentForm";
import TweetCard from "../UI/TweetCard";
import DeleteButton from "../UI/DeleteButton";

const TweetsFeed = () => {
  const [tweets, setTweets] = useState(null);
  const SERVER_SIDE = "http://127.0.0.1:9292/";

  const fetchTweets = async () => {
    const response = await fetch(SERVER_SIDE, { method: "GET" });
    const json = await response.json();

    setTweets(json);
  };

  useEffect(() => fetchTweets(), []);

  return (
    <div className="feed">
      <div className="feed-header">
        <h3>Home</h3>
        <i className="far fa-star"></i>
      </div>
      <TweetForm SERVER_SIDE={SERVER_SIDE} />
      <div>
        {tweets &&
          tweets.data.map((tweet) => (
            <TweetCard className="tweet">
              <p key={tweet.id}>{tweet.tweet}</p>

              <CommentForm SERVER_SIDE={SERVER_SIDE} tweet_id={tweet.id} />
              <div className="tweetComments">
                {tweet.comments.map((comment) => (
                  <p key={comment[0]}>{comment[1]}</p>
                ))}
              </div>

              <div className="tweetOptions">
                <div>
                  <i className="far fa-comment"></i>
                  <span> {tweet.comments.length} Comments</span>
                </div>
                <DeleteButton SERVER_SIDE={SERVER_SIDE} tweet={tweet} />
              </div>
            </TweetCard>
          ))}
      </div>
    </div>
  );
};

export default TweetsFeed;
