<!DOCTYPE html>
<html lang="en">
<?php
    include($level.HEAD."head.php");
?>

<body class="animsition">
<!-- ==================================HOME================================================ -->

    <?php
    if($_isHome==true){
        // Header
        include($level.HEADER."header_home.php");
        // Cart
        include($level.HOME."cart.php");
        // Slider
        include($level.HOME."slider.php");
        // Banner
        include($level.HOME."banner.php");
        // Product
        include($level.HOME."product.php");
        // Modal1
        include($level.HOME."modal1.php");
    }
    ?>
 <!-- ======================================= HOME 02 ================================= -->

    <?php
        if($_isHome02==true){
            // Header
            include($level.HEADER."header_home02.php");
            // Sidebar
            include($level.HOME02."slidebar.php");
            // Cart
            include($level.HOME02."cart.php");
            // Slider
            include($level.HOME02."slider.php");
            // Banner
            include($level.HOME02."banner.php");
            // Product
            include($level.HOME02."product.php");
            // Product Club 
            //include($level.HOME02."productclub.php");
            // Blog
            include($level.HOME02."blog.php");
            // Modal1
            include($level.HOME02."modal1.php");
        }
    ?>
<!-- ======================================= HOME 03 ================================= -->
    <?php
        if($_isHome03==true){
            // Header 03
            include($level.HEADER."header-home03.php");
            // Sidebar
            include($level.HOME03."slidebar.php");
            // Cart
            include($level.HOME03."cart.php");
            // Slider
            include($level.HOME03."slider.php");
            // Banner
            include($level.HOME03."banner.php");
            // Product
            include($level.HOME03."product.php");
            // Modal1
            include($level.HOME03."modal1.php");
        }
    ?>
<!-- ======================================= ABOUT ================================= -->
    <?php
        if($_isAbout==true){
            // Header 03
            include($level.HEADER."header-about.php");
            // Cart
            include($level.ABO."cart.php");
            // Slider
            include($level.ABO."title-pages.php");
            // Banner
            include($level.ABO."cont-page.php");
        }
    ?>
    <!-- ======================================= BLOG ================================= -->
    <?php
        if($_isBlog==true){
            // Header blog detail
            include($level.HEADER."header_blog.php");
            // Cart
            include($level.BLOG."cart.php"); 
            // Slider
            include($level.BLOG."title-page.php");
            // Banner
            include($level.BLOG."cont-page.php");
        }
    ?>
    <!-- ======================================= BLOG DETAIL ================================= -->
    <?php
        if($_isBlogDetail==true){
            // Header blog detail
            include($level.HEADER."header_blog-detail.php");
            // Cart
            include($level.BLOG_DETAIL."cart.php");
            // Slider
            include($level.BLOG_DETAIL."breadcrumb.php");
            // Banner
            include($level.BLOG_DETAIL."cont-page.php");
        }
    ?>
<!-- ======================================= CONTACT ================================= -->
<?php
        if($_isContact==true){
            // Header blog detail
            include($level.HEADER."header_contact.php");
            // Cart
            include($level.CONT."cart.php");
            // Slider
            include($level.CONT."title-page.php");
            // Banner
            include($level.CONT."cont-page.php");
            // Map
            include($level.CONT."map.php");
        }
    ?>
    <!-- ======================================= PRODUCT DETAIL ================================= -->
<?php
        if($_isProdDetail==true){
            // Header
            include($level.HEADER."header_product-detail.php");
            // Cart
            include($level.PRO_DETAIL."cart.php");
            // breadcrumd
            include($level.PRO_DETAIL."breadcrumb.php");
            // product-detail
            include($level.PRO_DETAIL."product-detail.php");
            // related-product
            include($level.PRO_DETAIL."related-product.php");
        }
    ?>
    <?php
        if($_isProduct==true){
            // Header
            include($level.HEADER."header_product.php");
            // Cart
            include($level.PRODUCT."cart.php");
            // product-detail
            include($level.PRODUCT."product.php");
            // related-product
            include($level.PRODUCT."modal1.php");
        }
    ?>
    <?php
        if($_isProductclub==true){
            // Header
            include($level.HEADER."header_productclub.php");
            // Cart
            include($level.PRODUCTclub."cart.php");
            // product-detail
            include($level.PRODUCTclub."productclub.php");
            // related-product
            include($level.PRODUCTclub."modal1.php");
        }
    ?>
    <?php
        if($_isProductnation==true){
            // Header
            include($level.HEADER."header_productnation.php");
            // Cart
            include($level.PRODUCTnation."cart.php");
            // product-detail
            include($level.PRODUCTnation."productnation.php");
            // related-product
            include($level.PRODUCTnation."modal1.php");
        }
    ?>
    <?php
        if($_isShop==true){
            // Header
            include($level.HEADER."header_shoping-cart.php");
            // Cart
            include($level.SHOP."cart.php");
            // product-detail
            include($level.SHOP."breadcrumb.php");
            // related-product
            include($level.SHOP."shoping-cart.php");
        }
    ?>

    <?php
        include($level.SCRI."script.php");
        // Back to top
        include($level.FOO."back_to_top.php");
        // footer
        include($level.FOO."footer.php");
        
   ?>

</body>

</html>