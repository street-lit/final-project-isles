var navbarLoggedIn = React.createClass({
  render: function() {
    return (
      <nav className="">
        <div className="nav-wrapper">
          <a href="/welcome" className="brand-logo">Isles</a>
          <ul id="nav-mobile" className="right hide-on-med-and-down">
            <li><a href="/welcome">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/logout" rel="no-follow" data-method="DELETE">Logout</a></li>
          </ul>
        </div>
      </nav>
    );
  }
});
