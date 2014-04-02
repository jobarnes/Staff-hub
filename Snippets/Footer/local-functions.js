// add divider after every 3rd link block
    jQuery(document).ready(function($){
        $( ".link-block > ul > li:nth-child(3n)").after( "<hr>" );
    });