<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
    <%@ page import="com.chainsys.eventmanagement.model.User" %>
    <%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html lang=en>
<head>
    <meta charset="UTF-8">
    <title>Event Services</title>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    
  
 
    
         .containerr {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            margin-top: 0;
            color:#3e617e;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        .menu-container, .package-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .menu-item, .package-item {
            position: relative;
            width: 30%;
            margin: 0 10px;
            overflow: hidden;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }
        .menu-item:hover, .package-item:hover {
            transform: scale(1.05);
        }
        .menu-item img, .package-item img {
            width: 100%;
            height: auto;
            display: block;
        }
        .item-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: rgba(16, 16, 14, 0.5);
            color: #7ffc01;
            padding: 10px;
            box-sizing: border-box;
            transition: bottom 0.3s ease-in-out;
        }
        
        .menu-item:hover .item-caption, .package-item:hover .item-caption {
            bottom: -50px;
        }

        service { background-color: var(--white-1); }

.service :is(.section-title, .section-text) { text-align: center; }

.service .section-text { margin-block: 10px 35px; }

.service-list {
  display: grid;
  gap: 25px;
}

.service-card {
  border-radius: var(--radius-6);
  overflow: hidden;
  box-shadow: var(--shadow-1);
}

.service-card .card-banner {
  background-color: var(--light-gray);
  aspect-ratio: 1 / 0.47;
}

.service-card .card-content { padding: 20px; }

.service-card .card-title { transition: var(--transition-1); }

.service-card .card-title:is(:hover, :focus) { color: var(--winter-sky); }

.service-card .card-text {
  margin-block: 10px 20px;
  line-height: 1.8;
}

.service-card .btn-link { color: var(--ultramarine); }

.service-card { --radius-6: 16px; }

.service-card .card-content { padding: 30px; }
.service-list {
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
  }
  .container { padding-inline: 15px; }

.section { padding-block: var(--section-padding); }

.w-100 { width: 100%; }


.section-text { line-height: 1.7; }


:root {

/**
 * colors
 */

 --gold-web-golden: hsl(50, 95%, 56%);
--spanish-orange: hsl(24, 100%, 45%);
--persian-green: hsl(175, 80%, 33%);
--granite-gray: hsl(0, 0%, 40%);
--spring-green: hsl(143, 85%, 58%);
--ultramarine: hsl(260, 100%, 44%);
--blue-violet: hsl(272, 76%, 53%);
--smoky-black: hsl(0, 0%, 7%);
--dark-orange: hsl(33, 100%, 50%);
--winter-sky: hsl(332, 100%, 51%);
--cultured-1: hsl(0, 0%, 98%);
--cultured-2: hsl(0, 0%, 95%);
--cultured-3: hsl(0, 0%, 94%);
--light-gray: hsl(0, 0%, 80%);
--alice-blue: hsl(206, 89%, 93%);
--white_50: hsla(0, 0%, 100%, 0.5);
--white-1: hsl(0, 0%, 100%);
--white-2: hsl(0, 0%, 99%);
--black: hsl(0, 0%, 0%);

/**
 * typography
 */

--ff-spartan: 'League Spartan', sans-serif;

--fs-1: 3rem;
--fs-2: 2.7rem;
--fs-3: 2.2rem;
--fs-4: 1.8rem;
--fs-5: 1.6rem;

--fw-400: 400;
--fw-500: 500;
--fw-600: 600;
--fw-700: 700;
--fw-900: 900;

/**
 * spacing
 */

--section-padding: 60px;

/**
 * box shadow
 */

--shadow-1: 0 2px 25px hsla(0, 0%, 0%, 0.1);
--shadow-2: 0 8px 14px hsla(0, 0%, 0%, 0.1);
--shadow-3: 0 14px 30px hsla(0, 0%, 0%, 0.05);

/**
 * border radius
 */

--radius-6: 6px;
--radius-12: 12px;

/**
 * gradient
 */

 --gradient-1: linear-gradient(to right, var(--winter-sky), var(--dark-orange));
--gradient-2: linear-gradient(to right, var(--ultramarine), var(--blue-violet));
--gradient-3: linear-gradient(to right, var(--winter-sky), var(--dark-orange));
--gradient-4: linear-gradient(to right, var(--ultramarine), var(--blue-violet));
--gradient-5: linear-gradient(to right, var(--persian-green), var(--spring-green));
--gradient-6: linear-gradient(to right, var(--spanish-orange), var(--gold-web-golden));

/**
 * transition
 */

 --transition-1: 0.25s ease;
--transition-2: 0.5s ease;
--cubic-out: cubic-bezier(0.33, 0.85, 0.4, 0.96);

}




*,
*::before,
*::after {
margin: 0;
padding: 0;
box-sizing: border-box;
}

li { list-style: none; }

a {
text-decoration: none;
color: inherit;
}

a,
img,
svg,
span,
input,
button,
strong,
ion-icon { display: block; }

img { height: auto; }

input,
button {
background: none;
border: none;
font: inherit;
}

input { width: 100%; }

button { cursor: pointer; }

ion-icon { pointer-events: none; }

html {
font-family: var(--ff-spartan);
font-size: 10px;
scroll-behavior: smooth;
}

body {
background-color: var(--white-1);
color: var(--granite-gray);
font-size: 1.6rem;
}

:focus-visible { outline-offset: 4px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#"><img src="images/epic-events-high-resolution-logo.png" alt="Company Logo" style="height: 40px;"></a>
    <span class="navbar-text mr-auto">EPIC EVENTS</span>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="service.jsp">Services</a>
      </li>
       <% if (!isLoggedIn) { %>
                <!-- Show Sign Up and Sign In only if the user is not logged in -->
                <li class="nav-item">
                    <a class="nav-link" href="registration.jsp">Sign Up</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sign In
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="signIn.jsp">Admin</a>
                        <a class="dropdown-item" href="user.jsp">User</a>
                    </div>
                </li>
                <% } else { %>
                <!-- Show user's name if logged in -->
                <li class="nav-item">
                    <span class="nav-link">Hii <%= user.getUserName() %></span>
                    
                </li>
                <li class="nav-item">
                      <form action="logout" method="post">
                        <button type="submit" class="btn btn-primary">Logout</button>
                    </form>
                </li>
                <% } %>
            </ul>
  </div>
</nav>

	
    <section class="section service" id="services">
        <div class="container">
    
          <h2 class="h2 section-title">Our Services</h2>
    
          <p class="section-text">
            We offer our support in various categories, more than us our services speaks a lot. We listed some categories below, will extend further. 
          </p>
    
          <ul class="service-list">
    
            <li>
              <div class="service-card">
    
                <figure class="card-banner">
                  <img src="images/social.webp" width="728" height="344" loading="lazy" alt="support"
                    class="w-100">
                </figure>
    
                <div class="card-content">
    
                  <h3 class="h3">
                    <a href="#" class="card-title">Social Events</a>
                  </h3>
    
                  <p class="card-text">
                    An occasion on which people can assemble for social interaction and entertainment like weddings, birthdays etc. we can help you organsise better.
                  </p>
    
                  <a href="#" class="btn-link">
                    <span class="span">Learn More</span>
    
                    <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                  </a>
    
                </div>
    
              </div>
            </li>
    
            <li>
              <div class="service-card">
    
                <figure class="card-banner">
                  <img src="images/corporate.webp" width="728" height="344" loading="lazy" alt="Engagement"
                    class="w-100">
                </figure>
    
                <div class="card-content">
    
                  <h3 class="h3">
                    <a href="#" class="card-title">Corporate Events</a>
                  </h3>
    
                  <p class="card-text">
                    Events organized by a corporate tend to have several goals. what we do is give you tension free enviroment and make all essential arrangements. 
                  </p>
    
                  <a href="#" class="btn-link">
                    <span class="span">Learn More</span>
    
                    <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                  </a>
    
                </div>
    
              </div>
            </li>
    
            <li>
              <div class="service-card">
    
                <figure class="card-banner">
                  <img src="images/entertainment.jpg" width="728" height="344" loading="lazy" alt="Marketing"
                    class="w-100">
                </figure>
    
                <div class="card-content">
    
                  <h3 class="h3">
                    <a href="#" class="card-title">Entertainment Events</a>
                  </h3>
    
                  <p class="card-text">
                    Entertainment Events or Special Events are Events organized by individuals or group of people, targeting large scale audience.
                  </p>
    
                  <a href="#" class="btn-link">
                    <span class="span">Learn More</span>
    
                    <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                  </a>
    
                </div>
    
              </div>
            </li>
    
          </ul>
    
        </div>
      </section>
     
   
    <section>
    <div class="containerr">
        <h2>Corporate Events</h2>
        <div class="menu-container">
            <div class="menu-item">
           <a href="eventdetails.jsp?event=conference">
                <img src="images/conference.jpeg" alt="Menu 1">
                <div class="item-caption" >Conference</div>
            </div>
            <div class="menu-item">
            <a href="eventdetails.jsp?event=ProductLaunch">
                <img src="images/product.webp" alt="Menu 2">
                <div class="item-caption">Product Launch</div>
            </div>
            <div class="menu-item">
           <a href="eventdetails.jsp?event=TradeShows">
                <img src="images/trade.jpeg" alt="Menu 3">
                <div class="item-caption">Trade Shows</div>
            </div>
        </div>
        
        <h2>Social Events</h2>
        <div class="package-container">
            <div class="package-item">
            <a href="eventdetails.jsp?event=Weddings">
                <img src="images/events1.jpeg" alt="Package 1">
                <div class="item-caption">Weddings</div>
                </a>
            </div>
            <div class="package-item">
            <a href="eventdetails.jsp?event=Birthdays">
                <img src="images/birthday.webp" alt="Package 2">
                <div class="item-caption">Birthdays</div>
                </a>
            </div>
            <div class="package-item">
			<a href="eventdetails.jsp?event=Anniversaries">
                <img src="images/anniversary.webp" alt="Package 3">
                <div class="item-caption">Anniversaries</div>
                </a>
            </div>
            
        </div>
        
         <h2>Entertainment Events</h2>
        <div class="menu-container">
            <div class="menu-item">
         <form action="/book" method="post">
        <input type="hidden" name="eventType" value="MusicConcerts">
        <button>
                <img src="images/music.webp" alt="Menu 1">
                <div class="item-caption" >Music Concerts</div>
                </button>
                </form>
            </div>
            <div class="menu-item">
  			<a href="#" onclick="getEvents('DanceShows')">
                <img src="images/dance.webp" alt="Menu 2">
                <div class="item-caption">Dance Shows</div>
            </div>
            <div class="menu-item">
              <a href="#" onclick="getEvents('ComedyShows')">
                <img src="images/mike.webp" alt="Menu 3">
                <div class="item-caption">Comedy Shows</div>
            </div>
        </div>
        
    </div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    function getEvents(eventType) {
        $.ajax({
            url: '/events/' + eventType,
            type: 'GET',
            success: function(response) {
                console.log('Event type: ' + eventType + ' retrieved successfully');
                // Handle response data as needed
            },
            error: function(xhr, status, error) {
                console.error('Error fetching ' + eventType + ' events: ' + error);
            }
        });
    }
</script> 

     
     
</body>
</html>
