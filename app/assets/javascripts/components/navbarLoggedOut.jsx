var navbarLoggedOut = React.createClass({
  render: function() {
    return (
      <nav className="">
        <div className="nav-wrapper">
          <a href="/welcome" className="brand-logo">Isles</a>
          <ul id="nav-mobile" className="right hide-on-med-and-down">
            <li><a href="/about">About</a></li>
            <li><a href="/login">Login</a></li>
            <li><a href="/users/new">Sign Up</a></li>
          </ul>
        </div>
      </nav>
    );
  }
});
