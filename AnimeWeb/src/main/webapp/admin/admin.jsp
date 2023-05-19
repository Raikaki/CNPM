
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>FinDash - Responsive Bootstrap 4 Admin Dashboard Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/favicon.ico" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../anime-main/css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="../anime-main/css/ds/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Full calendar -->
    <link href='fullcalendar/core/main.css' rel='stylesheet' />
    <link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
    <link href='fullcalendar/timegrid/main.css' rel='stylesheet' />
    <link href='fullcalendar/list/main.css' rel='stylesheet' />

    <link rel="stylesheet" href="css/flatpickr.min.css">

</head>
<body>
<!-- loader Start -->
<div id="loading">
    <div id="loading-center">
    </div>
</div>
<!-- loader END -->
<!-- Wrapper Start -->
<div class="wrapper">
    <!-- Sidebar  -->
    <div class="iq-sidebar">
        <div class="iq-navbar-logo d-flex justify-content-between">
            <a href="index.html" class="header-logo">
                <img src="images/logo.png" class="img-fluid rounded" alt="">
                <span>FinDash</span>
            </a>
            <div class="iq-menu-bt align-self-center">
                <div class="wrapper-menu">
                    <div class="main-circle"><i class="ri-menu-line"></i></div>
                    <div class="hover-circle"><i class="ri-close-fill"></i></div>
                </div>
            </div>
        </div>
        <div id="sidebar-scrollbar">
            <nav class="iq-sidebar-menu">
                <ul id="iq-sidebar-toggle" class="iq-menu">
                    <li class="active">
                        <a href="#dashboard" class="iq-waves-effect" data-toggle="collapse" aria-expanded="true"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Dashboard</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="dashboard" class="iq-submenu collapse show" data-parent="#iq-sidebar-toggle">
                            <li class="active"><a href="index.html"><i class="las la-laptop-code"></i>Account Dashboard</a></li>

                        </ul>
                    </li>


                    <li>
                        <a href="#userinfo" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-user-tie iq-arrow-left"></i><span>User</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="userinfo" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle" style="">
                            <li><a href="profile.html"><i class="las la-id-card-alt"></i>User Profile</a></li>
                            <li><a href="profile-edit.html"><i class="las la-edit"></i>User Edit</a></li>
                            <li><a href="add-user.html"><i class="las la-plus-circle"></i>User Add</a></li>
                            <li><a href="user-list.html"><i class="las la-th-list"></i>User List</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#ui-elements" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="lab la-elementor iq-arrow-left"></i><span>UI Elements</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="ui-elements" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="ui-colors.html"><i class="las la-palette"></i>colors</a></li>
                            <li><a href="ui-typography.html"><i class="las la-keyboard"></i>Typography</a></li>
                            <li><a href="ui-alerts.html"><i class="las la-tag"></i>Alerts</a></li>
                            <li><a href="ui-badges.html"><i class="lab la-atlassian"></i>Badges</a></li>
                            <li><a href="ui-breadcrumb.html"><i class="las la-bars"></i>Breadcrumb</a></li>
                            <li><a href="ui-buttons.html"><i class="las la-tablet"></i>Buttons</a></li>
                            <li><a href="ui-cards.html"><i class="las la-credit-card"></i>Cards</a></li>
                            <li><a href="ui-carousel.html"><i class="las la-film"></i>Carousel</a></li>
                            <li><a href="ui-embed-video.html"><i class="las la-video"></i>Video</a></li>
                            <li><a href="ui-grid.html"><i class="las la-border-all"></i>Grid</a></li>
                            <li><a href="ui-images.html"><i class="las la-images"></i>Images</a></li>
                            <li><a href="ui-list-group.html"><i class="las la-list"></i>list Group</a></li>
                            <li><a href="ui-media-object.html"><i class="las la-ad"></i>Media</a></li>
                            <li><a href="ui-modal.html"><i class="las la-columns"></i>Modal</a></li>
                            <li><a href="ui-notifications.html"><i class="las la-bell"></i>Notifications</a></li>
                            <li><a href="ui-pagination.html"><i class="las la-ellipsis-h"></i>Pagination</a></li>
                            <li><a href="ui-popovers.html"><i class="las la-eraser"></i>Popovers</a></li>
                            <li><a href="ui-progressbars.html"><i class="las la-hdd"></i>Progressbars</a></li>
                            <li><a href="ui-tabs.html"><i class="las la-database"></i>Tabs</a></li>
                            <li><a href="ui-tooltips.html"><i class="las la-magnet"></i>Tooltips</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#forms" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="lab la-wpforms iq-arrow-left"></i><span>Forms</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="forms" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="form-layout.html"><i class="las la-book"></i>Form Elements</a></li>
                            <li><a href="form-validation.html"><i class="las la-edit"></i>Form Validation</a></li>
                            <li><a href="form-switch.html"><i class="las la-toggle-off"></i>Form Switch</a></li>
                            <li><a href="form-chechbox.html"><i class="las la-check-square"></i>Form Checkbox</a></li>
                            <li><a href="form-radio.html"><i class="ri-radio-button-line"></i>Form Radio</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#wizard-form" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-archive-drawer-line iq-arrow-left"></i><span>Forms Wizard</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="wizard-form" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="form-wizard.html"><i class="ri-clockwise-line"></i>Simple Wizard</a></li>
                            <li><a href="form-wizard-validate.html"><i class="ri-clockwise-2-line"></i>Validate Wizard</a></li>
                            <li><a href="form-wizard-vertical.html"><i class="ri-anticlockwise-line"></i>Vertical Wizard</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#tables" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-table-line iq-arrow-left"></i><span>Table</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="tables" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="tables-basic.html"><i class="ri-table-line"></i>Basic Tables</a></li>
                            <li><a href="data-table.html"><i class="ri-database-line"></i>Data Table</a></li>
                            <li><a href="table-editable.html"><i class="ri-refund-line"></i>Editable Table</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#charts" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pie-chart-box-line iq-arrow-left"></i><span>Charts</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="charts" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">

                            <li><a href="chart-apex.html"><i class="ri-folder-chart-2-line"></i>Apex Chart</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#icons" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-list-check iq-arrow-left"></i><span>Icons</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="icons" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="icon-dripicons.html"><i class="ri-stack-line"></i>Dripicons</a></li>
                            <li><a href="icon-fontawesome-5.html"><i class="ri-facebook-fill"></i>Font Awesome 5</a></li>
                            <li><a href="icon-lineawesome.html"><i class="ri-keynote-line"></i>line Awesome</a></li>
                            <li><a href="icon-remixicon.html"><i class="ri-remixicon-line"></i>Remixicon</a></li>
                            <li><a href="icon-unicons.html"><i class="ri-underline"></i>unicons</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#authentication" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pages-line iq-arrow-left"></i><span>Authentication</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="authentication" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="sign-in.html"><i class="las la-sign-in-alt"></i>Login</a></li>
                            <li><a href="sign-up.html"><i class="ri-login-circle-line"></i>Register</a></li>
                            <li><a href="pages-recoverpw.html"><i class="ri-record-mail-line"></i>Recover Password</a></li>
                            <li><a href="pages-confirm-mail.html"><i class="ri-file-code-line"></i>Confirm Mail</a></li>
                            <li><a href="pages-lock-screen.html"><i class="ri-lock-line"></i>Lock Screen</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#extra-pages" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pantone-line iq-arrow-left"></i><span>Extra Pages</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="extra-pages" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="pages-timeline.html"><i class="ri-map-pin-time-line"></i>Timeline</a></li>
                            <li><a href="pages-invoice.html"><i class="ri-question-answer-line"></i>Invoice</a></li>
                            <li><a href="blank-page.html"><i class="ri-invision-line"></i>Blank Page</a></li>
                            <li><a href="pages-error.html"><i class="ri-error-warning-line"></i>Error 404</a></li>
                            <li><a href="pages-error-500.html"><i class="ri-error-warning-line"></i>Error 500</a></li>
                            <li><a href="pages-pricing.html"><i class="ri-price-tag-line"></i>Pricing</a></li>
                            <li><a href="pages-pricing-one.html"><i class="ri-price-tag-2-line"></i>Pricing 1</a></li>
                            <li><a href="pages-maintenance.html"><i class="ri-archive-line"></i>Maintenance</a></li>
                            <li><a href="pages-comingsoon.html"><i class="ri-mastercard-line"></i>Coming Soon</a></li>
                            <li><a href="pages-faq.html"><i class="ri-compasses-line"></i>Faq</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#menu-level" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-record-circle-line iq-arrow-left"></i><span>Menu Level</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="menu-level" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                            <li><a href="#"><i class="ri-record-circle-line"></i>Menu 1</a></li>
                            <li>
                                <a href="#"><i class="ri-record-circle-line"></i>Menu 2</a>

                            </li>
                            <li><a href="#"><i class="ri-record-circle-line"></i>Menu 3</a></li>
                            <li><a href="#"><i class="ri-record-circle-line"></i>Menu 4</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="p-3"></div>
        </div>
    </div>
    <!-- TOP Nav Bar -->
    <div class="iq-top-navbar">
        <div class="iq-navbar-custom">
            <nav class="navbar navbar-expand-lg navbar-light p-0">
                <div class="iq-menu-bt d-flex align-items-center">
                    <div class="wrapper-menu">
                        <div class="main-circle"><i class="ri-menu-line"></i></div>
                        <div class="hover-circle"><i class="ri-close-fill"></i></div>
                    </div>
                    <div class="iq-navbar-logo d-flex justify-content-between ml-3">
                        <a href="index.html" class="header-logo">
                            <img src="images/logo.png" class="img-fluid rounded" alt="">
                            <span>FinDash</span>
                        </a>
                    </div>
                </div>
                <div class="iq-search-bar">
                    <form action="#" class="searchbox">
                        <input type="text" class="text search-input" placeholder="Type here to search...">
                        <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                    </form>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  aria-label="Toggle navigation">
                    <i class="ri-menu-3-line"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-list">
                        <li class="nav-item">
                            <a class="search-toggle iq-waves-effect language-title" href="#"><span class="ripple rippleEffect" style="width: 98px; height: 98px; top: -15px; left: 56.2969px;"></span><img src="images/small/flag-01.png" alt="img-flaf" class="img-fluid mr-1" style="height: 16px; width: 16px;"> EN <i class="ri-arrow-down-s-line"></i></a>
                            <div class="iq-sub-dropdown">
                                <a class="iq-sub-card" href="#"><img src="images/small/flag-02.png" alt="img-flaf" class="img-fluid mr-2">French</a>
                                <a class="iq-sub-card" href="#"><img src="images/small/flag-03.png" alt="img-flaf" class="img-fluid mr-2">Spanish</a>
                                <a class="iq-sub-card" href="#"><img src="images/small/flag-04.png" alt="img-flaf" class="img-fluid mr-2">Italian</a>
                                <a class="iq-sub-card" href="#"><img src="images/small/flag-05.png" alt="img-flaf" class="img-fluid mr-2">German</a>
                                <a class="iq-sub-card" href="#"><img src="images/small/flag-06.png" alt="img-flaf" class="img-fluid mr-2">Japanese</a>
                            </div>
                        </li>
                        <li class="nav-item nav-icon">
                            <a href="#" class="iq-waves-effect bg-primary rounded"><span class="ripple rippleEffect"></span><i class="ri-shopping-cart-2-line"></i></a>
                        </li>
                        <li class="nav-item nav-icon">
                            <a href="#" class="search-toggle iq-waves-effect bg-primary rounded">
                                <i class="ri-notification-line"></i>
                                <span class="bg-danger dots"></span>
                            </a>
                            <div class="iq-sub-dropdown">
                                <div class="iq-card shadow-none m-0">
                                    <div class="iq-card-body p-0 ">
                                        <div class="bg-primary p-3">
                                            <h5 class="mb-0 text-white">All Notifications<small class="badge  badge-light float-right pt-1">4</small></h5>
                                        </div>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Emma Watson Barry</h6>
                                                    <small class="float-right font-size-12">Just Now</small>
                                                    <p class="mb-0">95 MB</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">New customer is join</h6>
                                                    <small class="float-right font-size-12">5 days ago</small>
                                                    <p class="mb-0">Cyst Barry</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Two customer is left</h6>
                                                    <small class="float-right font-size-12">2 days ago</small>
                                                    <p class="mb-0">Cyst Barry</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">New Mail from Fenny</h6>
                                                    <small class="float-right font-size-12">3 days ago</small>
                                                    <p class="mb-0">Cyst Barry</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item nav-icon dropdown">
                            <a href="#" class="search-toggle iq-waves-effect bg-primary rounded">
                                <i class="ri-mail-line"></i>
                                <span class="bg-danger count-mail"></span>
                            </a>
                            <div class="iq-sub-dropdown">
                                <div class="iq-card shadow-none m-0">
                                    <div class="iq-card-body p-0 ">
                                        <div class="bg-primary p-3">
                                            <h5 class="mb-0 text-white">All Messages<small class="badge  badge-light float-right pt-1">5</small></h5>
                                        </div>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Barry Emma Watson</h6>
                                                    <small class="float-left font-size-12">13 Jun</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Lorem Ipsum Watson</h6>
                                                    <small class="float-left font-size-12">20 Apr</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Why do we use it?</h6>
                                                    <small class="float-left font-size-12">30 Jun</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Variations Passages</h6>
                                                    <small class="float-left font-size-12">12 Sep</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="iq-sub-card" >
                                            <div class="media align-items-center">
                                                <div class="">
                                                    <img class="avatar-40 rounded" src="images/user/05.jpg" alt="">
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Lorem Ipsum generators</h6>
                                                    <small class="float-left font-size-12">5 Dec</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <ul class="navbar-list">
                    <li class="line-height">
                        <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                            <img src="images/user/1.jpg" class="img-fluid rounded mr-3" alt="user">
                            <div class="caption">
                                <h6 class="mb-0 line-height">Barry Tech</h6>
                                <p class="mb-0">Manager</p>
                            </div>
                        </a>
                        <div class="iq-sub-dropdown iq-user-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white line-height">Hello Barry Tech</h5>
                                        <span class="text-white font-size-12">Available</span>
                                    </div>
                                    <a href="profile.html" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-file-user-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">My Profile</h6>
                                                <p class="mb-0 font-size-12">View personal profile details.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="profile-edit.html" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-profile-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Edit Profile</h6>
                                                <p class="mb-0 font-size-12">Modify your personal details.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="account-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-account-box-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Account settings</h6>
                                                <p class="mb-0 font-size-12">Manage your account parameters.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="privacy-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-lock-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Privacy Settings</h6>
                                                <p class="mb-0 font-size-12">Control your privacy parameters.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="d-inline-block w-100 text-center p-3">
                                        <a class="bg-primary iq-sign-btn" href="sign-in.html" role="button">Sign out<i class="ri-login-box-line ml-2"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- TOP Nav Bar END -->

    <!-- Page Content  -->
    <div id="content-page" class="content-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-body iq-box-relative">
                            <div class="iq-box-absolute icon iq-icon-box rounded-circle iq-bg-primary">
                                <i class="ri-focus-2-line"></i>
                            </div>
                            <p class="text-secondary">Total Sales</p>
                            <div class="d-flex align-items-center justify-content-between">
                                <h4><b>$18 378</b></h4>
                                <div id="iq-chart-box1"></div>
                                <span class="text-primary"><b> +14% <i class="ri-arrow-up-fill"></i></b></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-body iq-box-relative">
                            <div class="iq-box-absolute icon iq-icon-box rounded-circle iq-bg-danger">
                                <i class="ri-pantone-line"></i>
                            </div>
                            <p class="text-secondary">Sales Today</p>
                            <div class="d-flex align-items-center justify-content-between">
                                <h4><b>$190</b></h4>
                                <div id="iq-chart-box2"></div>
                                <span class="text-danger"><b> -6% <i class="ri-arrow-down-fill"></i></b></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-body iq-box-relative">
                            <div class="iq-box-absolute icon iq-icon-box rounded-circle iq-bg-success">
                                <i class="ri-database-2-line"></i>
                            </div>
                            <p class="text-secondary">Total Classon</p>
                            <div class="d-flex align-items-center justify-content-between">
                                <h4><b>45</b></h4>
                                <div id="iq-chart-box3"></div>
                                <span class="text-success"><b> +0.36% <i class="ri-arrow-up-fill"></i></b></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-body iq-box-relative">
                            <div class="iq-box-absolute icon iq-icon-box rounded-circle iq-bg-warning">
                                <i class="ri-pie-chart-2-line"></i>
                            </div>
                            <p class="text-secondary">Total Profit</p>
                            <div class="d-flex align-items-center justify-content-between">
                                <h4><b>60</b></h4>
                                <div id="iq-chart-box4"></div>
                                <span class="text-warning"><b> +0.45% <i class="ri-arrow-up-fill"></i></b></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between">
                            <div class="iq-header-title">
                                <h4 class="card-title">Spendings Stats </h4>
                            </div>
                            <div class="iq-card-header-toolbar d-flex align-items-center">
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link active">Personal</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">Business</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">Credit</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="iq-card-body row m-0 align-items-center pb-0">
                            <div class="col-md-8">
                                <div id="iq-income-chart"></div>
                            </div>
                            <div class="col-md-4">
                                <div class="chart-data-block">
                                    <h4><b>Total</b></h4>
                                    <h2><b>$ 49000 </b></h2>
                                    <p>Income Top the Last Week</p>
                                    <div class="chart-box d-flex align-items-center justify-content-between mt-5 mb-5">
                                        <div id="iq-chart-boxleft"></div>
                                        <div id="iq-chart-boxright"></div>
                                    </div>
                                    <div class="mt-3 pr-3">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <span class="bg-primary p-1 rounded mr-2"></span>
                                                <p class="mb-0">Successful Deals</p>
                                            </div>
                                            <h6><b>78%</b></h6>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <span class="bg-danger p-1 rounded mr-2"></span>
                                                <p class="mb-0">Failed Deals</p>
                                            </div>
                                            <h6><b>12%</b></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height banner-image-block-bg position-relative" style="background: transparent url(images/page-img/45.png) no-repeat scroll center bottom; background-size: contain; height: 440px; box-shadow: none;">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between">
                            <div class="iq-header-title">
                                <h4 class="card-title">Open Invoices</h4>
                            </div>
                            <div class="iq-card-header-toolbar d-flex align-items-center">
                                <div class="dropdown">
                                 <span class="dropdown-toggle text-primary" id="dropdownMenuButton5" data-toggle="dropdown">
                                 <i class="ri-more-fill"></i>
                                 </span>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton5">
                                        <a class="dropdown-item" href="#"><i class="ri-eye-fill mr-2"></i>View</a>
                                        <a class="dropdown-item" href="#"><i class="ri-delete-bin-6-fill mr-2"></i>Delete</a>
                                        <a class="dropdown-item" href="#"><i class="ri-pencil-fill mr-2"></i>Edit</a>
                                        <a class="dropdown-item" href="#"><i class="ri-printer-fill mr-2"></i>Print</a>
                                        <a class="dropdown-item" href="#"><i class="ri-file-download-fill mr-2"></i>Download</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="iq-card-body">
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Invoice</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Ira Membrit</td>
                                        <td>18/10/2019</td>
                                        <td>20156</td>
                                        <td>$1500</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Copy</td>
                                    </tr>
                                    <tr>
                                        <td>Pete Sariya</td>
                                        <td>26/10/2019</td>
                                        <td>7859</td>
                                        <td>$2000</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Send Email</td>
                                    </tr>
                                    <tr>
                                        <td>Cliff Hanger</td>
                                        <td>18/11/2019</td>
                                        <td>6396</td>
                                        <td>$2500</td>
                                        <td>
                                            <div class="badge badge-pill badge-danger">Past Due</div>
                                        </td>
                                        <td>Before Due</td>
                                    </tr>
                                    <tr>
                                        <td>Terry Aki</td>
                                        <td>14/12/2019</td>
                                        <td>7854</td>
                                        <td>$5000</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Copy</td>
                                    </tr>
                                    <tr>
                                        <td>Anna Mull</td>
                                        <td>24/12/2019</td>
                                        <td>568569</td>
                                        <td>$10000</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Send Email</td>
                                    </tr>
                                    <tr>
                                        <td>Alex john</td>
                                        <td>05/12/2019</td>
                                        <td>45896</td>
                                        <td>$15236</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Send Email</td>
                                    </tr>
                                    <tr>
                                        <td>Rock lai</td>
                                        <td>28/12/2019</td>
                                        <td>458965</td>
                                        <td>$50200</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Send Email</td>
                                    </tr>
                                    <tr>
                                        <td>Cliff Hanger</td>
                                        <td>18/11/2019</td>
                                        <td>6396</td>
                                        <td>$2500</td>
                                        <td>
                                            <div class="badge badge-pill badge-danger">Past Due</div>
                                        </td>
                                        <td>Before Due</td>
                                    </tr>
                                    <tr>
                                        <td>Terry Aki</td>
                                        <td>14/12/2019</td>
                                        <td>7854</td>
                                        <td>$5000</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Copy</td>
                                    </tr>
                                    <tr>
                                        <td>Anna Mull</td>
                                        <td>24/12/2019</td>
                                        <td>568569</td>
                                        <td>$10000</td>
                                        <td>
                                            <div class="badge badge-pill badge-success">Paid</div>
                                        </td>
                                        <td>Send Email</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-body">
                            <div class="d-flex align-items-center mt-3">
                                <div class="icon iq-icon-box rounded iq-bg-danger mr-3">
                                    <i class="ri-shopping-bag-line"></i>
                                </div>
                                <div class="iq-details col-sm-9 p-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="title text-dark">Dailly expenses</span>
                                        <div class="percentage"><b><span>$</span> 620 </b></div>
                                    </div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                        <div class="iq-progress-bar">
                                            <span class="bg-danger" data-percent="67"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="">45 Transaction</span>
                                        <div class="percentage">67<span>%</span></div>
                                    </div>
                                </div>
                            </div>
                            <hr class="mt-4 mb-4">
                            <div class="d-flex align-items-center">
                                <div class="icon iq-icon-box rounded iq-bg-warning mr-3">
                                    <i class="ri-home-8-line"></i>
                                </div>
                                <div class="iq-details col-sm-9 p-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="title text-dark">House, bills</span>
                                        <div class="percentage"><b><span>$</span> 230 </b></div>
                                    </div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                        <div class="iq-progress-bar">
                                            <span class="bg-warning" data-percent="32"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="">38 Transaction</span>
                                        <div class="percentage">32<span>%</span></div>
                                    </div>
                                </div>
                            </div>
                            <hr class="mt-4 mb-4">
                            <div class="d-flex align-items-center">
                                <div class="icon iq-icon-box rounded iq-bg-success mr-3">
                                    <i class="ri-camera-lens-line"></i>
                                </div>
                                <div class="iq-details col-sm-9 p-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="title text-dark">Children</span>
                                        <div class="percentage float-right"><b><span>$</span> 120 </b></div>
                                    </div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                        <div class="iq-progress-bar">
                                            <span class="bg-success" data-percent="20"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="">9 Transaction</span>
                                        <div class="percentage float-right">20<span>%</span></div>
                                    </div>
                                </div>
                            </div>
                            <hr class="mt-4 mb-4">
                            <div class="d-flex align-items-center">
                                <div class="icon iq-icon-box rounded iq-bg-primary mr-3">
                                    <i class="ri-hospital-line"></i>
                                </div>
                                <div class="iq-details col-sm-9 p-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="title text-dark">Health</span>
                                        <div class="percentage float-right"><b><span>$</span> 80 </b></div>
                                    </div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                        <div class="iq-progress-bar">
                                            <span class="bg-primary" data-percent="30"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="">18 Transaction</span>
                                        <div class="percentage">30<span>%</span></div>
                                    </div>
                                </div>
                            </div>
                            <hr class="mt-4 mb-4">
                            <div class="d-flex align-items-center">
                                <div class="icon iq-icon-box rounded iq-bg-info mr-3">
                                    <i class="ri-bank-line"></i>
                                </div>
                                <div class="iq-details col-sm-9 p-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="title text-dark">Banking</span>
                                        <div class="percentage float-right"><b><span>$</span> 110 </b></div>
                                    </div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                        <div class="iq-progress-bar">
                                            <span class="bg-info" data-percent="60"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="">50 Transaction</span>
                                        <div class="percentage">60<span>%</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between">
                            <div class="iq-header-title">
                                <h4 class="card-title">User Percentage</h4>
                            </div>
                        </div>
                        <div class="iq-card-body">
                            <div id="home-perfomer-chart"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between">
                            <div class="iq-header-title">
                                <h4 class="card-title">Users</h4>
                            </div>
                        </div>
                        <div class="iq-card-body">
                            <ul class="perfomer-lists m-0 p-0">
                                <li class="d-flex mb-4 align-items-center">
                                    <div class="user-img img-fluid"><img src="images/page-img/29.png" alt="story-img" class="rounded avatar-40"></div>
                                    <div class="media-support-info ml-3">
                                        <h6>Dribble</h6>
                                        <p class="mb-0 font-size-12">Graphics Designer</p>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <span class="text-primary"><b>$10.00</b></span>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 align-items-center">
                                    <div class="user-img img-fluid"><img src="images/page-img/30.png" alt="story-img" class="rounded avatar-40"></div>
                                    <div class="media-support-info ml-3">
                                        <h6>Behance</h6>
                                        <p class="mb-0 font-size-12">Developer</p>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <span class="text-primary"><b>$25.50</b></span>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 align-items-center">
                                    <div class="user-img img-fluid"><img src="images/page-img/31.png" alt="story-img" class="rounded avatar-40"></div>
                                    <div class="media-support-info ml-3">
                                        <h6>Instagram</h6>
                                        <p class="mb-0 font-size-12">Posts</p>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <span class="text-primary"><b>$15.00</b></span>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 align-items-center">
                                    <div class="user-img img-fluid"><img src="images/page-img/32.png" alt="story-img" class="rounded avatar-40"></div>
                                    <div class="media-support-info ml-3">
                                        <h6>Twitter</h6>
                                        <p class="mb-0 font-size-12">Latest News</p>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <span class="text-primary"><b>$5.00</b></span>
                                    </div>
                                </li>
                                <li class="d-flex mb-4 align-items-center">
                                    <div class="user-img img-fluid"><img src="images/page-img/33.png" alt="story-img" class="rounded avatar-40"></div>
                                    <div class="media-support-info ml-3">
                                        <h6>Bootstrap</h6>
                                        <p class="mb-0 font-size-12">Ui/Ux Design</p>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <span class="text-primary"><b>$5.00</b></span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="iq-card iq-card-block iq-card-stretch" style="position: relative;">
                        <div class="iq-card-body">
                            <h6>Graph Profit Margin</h6>
                            <h2>80%</h2>
                        </div>
                        <div id="home-profit-chart"></div>
                    </div>
                    <div class="iq-card iq-card-block iq-card-stretch" style="position: relative;">
                        <div class="iq-card-body">
                            <h6>Graph Loss Margin</h6>
                            <h2>25%</h2>
                        </div>
                        <div id="home-loss-chart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Wrapper END -->
<!-- Footer -->
<footer class="iq-footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
                    <li class="list-inline-item"><a href="terms-of-service.html">Terms of Use</a></li>
                </ul>
            </div>
            <div class="col-lg-6 text-right">
                Copyright 2020 <a href="#">FinDash</a> All Rights Reserved.
            </div>
        </div>
    </div>
</footer>
<!-- Footer END -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="../anime-main/js/bootstrap.min.js"></script>
<!-- Appear JavaScript -->
<script src="js/jquery.appear.js"></script>
<!-- Countdown JavaScript -->
<script src="js/countdown.min.js"></script>
<!-- Counterup JavaScript -->
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<!-- Wow JavaScript -->
<script src="js/wow.min.js"></script>
<!-- Apexcharts JavaScript -->
<script src="js/apexcharts.js"></script>
<!-- Slick JavaScript -->
<script src="js/slick.min.js"></script>
<!-- Select2 JavaScript -->
<script src="js/select2.min.js"></script>
<!-- Owl Carousel JavaScript -->
<script src="../anime-main/js/owl.carousel.min.js"></script>
<!-- Magnific Popup JavaScript -->
<script src="js/jquery.magnific-popup.min.js"></script>
<!-- Smooth Scrollbar JavaScript -->
<script src="js/smooth-scrollbar.js"></script>
<!-- lottie JavaScript -->
<script src="js/lottie.js"></script>
<!-- am core JavaScript -->
<script src="js/core.js"></script>
<!-- am charts JavaScript -->
<script src="js/charts.js"></script>
<!-- am animated JavaScript -->
<script src="js/animated.js"></script>
<!-- am kelly JavaScript -->
<script src="js/kelly.js"></script>
<!-- am maps JavaScript -->
<script src="js/maps.js"></script>
<!-- am worldLow JavaScript -->
<script src="js/worldLow.js"></script>
<!-- Raphael-min JavaScript -->
<script src="js/raphael-min.js"></script>
<!-- Morris JavaScript -->
<script src="js/morris.js"></script>
<!-- Morris min JavaScript -->
<script src="js/morris.min.js"></script>
<!-- Flatpicker Js -->
<script src="js/flatpickr.js"></script>
<!-- Style Customizer -->
<script src="js/style-customizer.js"></script>
<!-- Chart Custom JavaScript -->
<script src="js/chart-custom.js"></script>
<!-- Custom JavaScript -->
<script src="js/custom.js"></script>
</body>
</html>
