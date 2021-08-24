import React, { useState, useEffect } from "react";

import "./NewsFeed.css";

const NewsFeed = () => {
  const [newsArticles, setNewsArticles] = useState();
  const fetchNewsArticles = async () => {
    await fetch(
      `https://gnews.io/api/v4/top-headlines?q=gb&token=${process.env.REACT_APP_NEWSFEED_API_KEY}`
    ).then((response) => {
      return response.json().then((articles) => {
        setNewsArticles(articles);
      });
    });
  };
  useEffect(() => fetchNewsArticles(), []);
  return (
    <React.Fragment>
      <h2>What's Happening</h2>
      {newsArticles &&
        newsArticles.articles.map((article) => {
          return (
            <div key={article.url} className="article">
              <div className="details">
                <a target="_blank" href={article.url}>
                  <p>{article.title}</p>
                </a>
              </div>
              <div className="image">
                <img src={article.image} alt="" />
              </div>
            </div>
          );
        })}
    </React.Fragment>
  );
};

export default NewsFeed;
