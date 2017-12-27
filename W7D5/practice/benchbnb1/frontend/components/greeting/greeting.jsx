import React from 'react';
import { Link } from 'react-router-dom';

const personalGreeting = (currentUser, logout) => {
  return (
    <div className="personal-greeting">
      <h2 className="greeting-header">Hi, {currentUser.username}!</h2>
      <button className="logout-button" onClick={logout}>Log Out</button>
    </div>
  );
};

const notLoggedIn = () => {
  return (
    <nav className="login-signup">
      <Link to="/login">Login</Link>
      or
      <Link to="/signup">Sign Up</Link>
    </nav>
  );
};

const Greeting = ({currentUser, logout}) => {
  
  if (currentUser) {
    return personalGreeting(currentUser, logout);
  } else {
    return notLoggedIn();
  }
};

export default Greeting;
