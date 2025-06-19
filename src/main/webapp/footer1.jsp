<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMyShow - Footer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
:root {
    --primary-color: #f84464;
    --text-light: #ffffff;
    --bg-dark: #1a1a1a;
    --bg-light: #2d2d2d;
    --text-gray: #999999;
}

.footer-container {
    background-color: var(--bg-dark);
    color: var(--text-light);
    padding: 3rem 0 1.5rem;
    margin-top: 3rem;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.contact-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    padding-bottom: 2rem;
    border-bottom: 1px solid #333;
}

.contact-info {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.contact-logo img {
    height: 40px;
}

.contact-text h4 {
    color: var(--primary-color);
    margin-bottom: 0.5rem;
}

.contact-text p {
    color: var(--text-gray);
    font-size: 0.9rem;
}

.support-section {
    display: flex;
    justify-content: space-around;
    margin: 2rem 0;
    padding: 1.5rem 0;
    border-top: 1px solid #333;
    border-bottom: 1px solid #333;
}

.support-item {
    display: flex;
    align-items: center;
    gap: 0.8rem;
}

.support-item img {
    height: 40px;
}

.support-item p {
    font-size: 0.8rem;
    color: var(--text-gray);
    font-weight: 500;
}

.content-section {
    margin: 2rem 0;
}

.section-title {
    color: var(--primary-color);
    font-size: 1rem;
    margin-bottom: 1rem;
    font-weight: 600;
}

.content-links {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-bottom: 1.5rem;
}

.content-link {
    color: var(--text-gray);
    font-size: 0.8rem;
    text-decoration: none;
    transition: color 0.2s;
}

.content-link:hover {
    color: var(--primary-color);
}

.content-link:after {
    content: "|";
    margin-left: 0.5rem;
    color: #444;
}

.content-link:last-child:after {
    content: none;
}

.divider {
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 2rem 0;
}

.divider-line {
    flex-grow: 1;
    height: 1px;
    background-color: #333;
}

.divider-logo {
    margin: 0 1.5rem;
}

.divider-logo img {
    height: 30px;
}

.social-section {
    display: flex;
    justify-content: center;
    gap: 1.5rem;
    margin: 1.5rem 0;
}

.social-icon {
    color: var(--text-gray);
    font-size: 1.5rem;
    transition: color 0.2s;
}

.social-icon:hover {
    color: var(--primary-color);
}

.copyright {
    text-align: center;
    color: var(--text-gray);
    font-size: 0.8rem;
    line-height: 1.5;
    padding-top: 1.5rem;
    border-top: 1px solid #333;
}

@media (max-width: 768px) {
    .contact-section {
        flex-direction: column;
        gap: 1.5rem;
        align-items: flex-start;
    }
    
    .support-section {
        flex-direction: column;
        gap: 1.5rem;
    }
    
    .content-links {
        gap: 0.3rem;
    }
    
    .content-link {
        font-size: 0.7rem;
    }
}
</style>
</head>
<body>
    <footer class="footer-container">
        <div class="footer-content">
            <div class="contact-section">
                <div class="contact-info">
                    <div class="contact-logo">
                        <img src="./assets/asset11.svg" alt="List Your Show">
                    </div>
                    <div class="contact-text">
                        <h4>List your Show</h4>
                        <p>Got a show, event, activity or a great experience? Partner with us & get listed on BookMyShow</p>
                    </div>
                </div>
                <a href="#" class="primary-button">Contact Today!</a>
            </div>
            
            <div class="support-section">
                <div class="support-item">
                    <img src="./assets/asset21.svg" alt="Customer Care">
                    <p>24/7 CUSTOMER CARE</p>
                </div>
                <div class="support-item">
                    <img src="./assets/asset22.svg" alt="Resend Booking">
                    <p>RESEND BOOKING CONFIRMATION</p>
                </div>
                <div class="support-item">
                    <img src="./assets/asset23.svg" alt="Newsletter">
                    <p>SUBSCRIBE TO THE NEWSLETTER</p>
                </div>
            </div>
            
            <div class="content-section">
                <h5 class="section-title">MOVIES NOW SHOWING IN BENGALURU</h5>
                <div class="content-links">
                    <a href="#" class="content-link">Bad Manners</a>
                    <a href="#" class="content-link">Napoleon</a>
                    <a href="#" class="content-link">Wish</a>
                    <a href="#" class="content-link">Aadikeshava</a>
                    <a href="#" class="content-link">Sapta Sagaradaache Ello - Side B</a>
                    <a href="#" class="content-link">Sugar Factory</a>
                    <a href="#" class="content-link">80s Buildup</a>
                    <a href="#" class="content-link">Farrey</a>
                    <a href="#" class="content-link">Tiger 3</a>
                    <a href="#" class="content-link">Swathi Mutthina Male Haniye</a>
                </div>
            </div>
            
            <!-- Repeat content-section for other categories -->
            
            <div class="divider">
                <div class="divider-line"></div>
                <div class="divider-logo">
                    <img src="./assets/asset15.svg" alt="BookMyShow">
                </div>
                <div class="divider-line"></div>
            </div>
            
            <div class="social-section">
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-pinterest-p"></i></a>
            </div>
            
            <div class="copyright">
                Copyright 2023 © Bigtree Entertainment Pvt. Ltd. All Rights Reserved.<br>
                The content and images used on this site are copyright protected and copyrights vests with the
                respective owners. The usage of the content and images on this website is intended to
                promote the works and no endorsement of the artist shall be implied. Unauthorized use is prohibited and
                punishable by law.
            </div>
        </div>
    </footer>
    
    <script src="https://kit.fontawesome.com/393fab6d21.js" crossorigin="anonymous"></script>
</body>
</html>