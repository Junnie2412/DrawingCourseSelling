<%-- 
    Document   : slidebar
    Created on : Oct 10, 2023, 8:19:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="app-menu navbar-menu">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <!-- Dark Logo-->
               
                   
                        <div class="text-center mt-sm-5 mb-4 text-white-50">
                            <div>
                                <a href="../index.jsp"class="d-inline-block auth-logo">
                                    <img src="assets/images/logomain.png" alt="logo" height="70" >
                                </a>
                            
                    </div>
                </div>
                <!-- Light Logo-->
                <a href="index.jsp" class="logo logo-light">
                    <span class="logo-sm">
                        
                    </span>
                    <span class="logo-lg">
                       
                    </span>
                </a>
                <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
                    <i class="ri-record-circle-line"></i>
                </button>
            </div>

            <div id="scrollbar">
                <div class="container-fluid">

                    <div id="two-column-menu">
                    </div>
                    <ul class="navbar-nav" id="navbar-nav">
                        <li class="menu-title"><span data-key="t-menu">Menu</span></li>
                        <li class="nav-item">
                            <a class="nav-link menu-link" href="#sidebarDashboards" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarDashboards">
                                <i class="mdi mdi-speedometer"></i> <span data-key="t-dashboards">Dashboard</span>
                            </a>
                            <div class="collapse menu-dropdown" id="sidebarDashboards">
                                <ul class="nav nav-sm flex-column">
                                    
                                   
                                    <li class="nav-item">
                                        <a href="admin.jsp" class="nav-link" data-key="t-ecommerce"> View static </a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </li> <!-- end Dashboard Menu -->
                        

                         <!-- end Dashboard Menu -->

                        <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-pages">Pages</span></li>

                        <li class="nav-item">
                            <form action="MainController" method="post">
                                <input type="submit" name="action" value="Staff Management">
                            </form>                           
                        </li>
                        <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-components">Components</span></li>

                        <li class="nav-item">
                            <a class="nav-link menu-link" href="#sidebarUI" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarUI">
                                <i class="mdi mdi-cube-outline"></i> <span data-key="t-base-ui">Base UI</span>
                            </a>
                            <div class="collapse menu-dropdown mega-dropdown-menu" id="sidebarUI">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <ul class="nav nav-sm flex-column">
                                            <li class="nav-item">
                                                <a href="ui-alerts.jsp" class="nav-link" data-key="t-alerts">Alerts</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-badges.jsp" class="nav-link" data-key="t-badges">Badges</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-buttons.jsp" class="nav-link" data-key="t-buttons">Buttons</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-colors.jsp" class="nav-link" data-key="t-colors">Colors</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-cards.jsp" class="nav-link" data-key="t-cards">Cards</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-carousel.jsp" class="nav-link" data-key="t-carousel">Carousel</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-dropdowns.jsp" class="nav-link" data-key="t-dropdowns">Dropdowns</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="ui-grid.jsp" class="nav-link" data-key="t-grid">Grid</a>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </li>

                        

                       

                        

                        

                        

                        

                        

                        

                    </ul>
                </div>
                <!-- Sidebar -->
            </div>

            <div class="sidebar-background"></div>
        </div>
        <!-- Left Sidebar End -->
        <!-- Vertical Overlay-->
        <div class="vertical-overlay"></div>
