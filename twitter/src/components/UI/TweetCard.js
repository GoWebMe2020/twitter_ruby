import React from "react";

import tweetCardStyles from "./TweetCard.module.css";

const TweetCard = (props) => {
  return (
    <div className={`${tweetCardStyles.tweetCard} ${props.className}`}>
      {props.children}
    </div>
  );
};

export default TweetCard;
