// add divider after every 3rd link block
    jQuery(document).ready(function($){
        $( ".link-block > ul > li:nth-child(3n)").after( "<hr>" );
    });
    
    
<!-- Zendesk feedback tab -->
<script type="text/javascript" src="//assets.zendesk.com/external/zenbox/v2.6/zenbox.js"></script>

<script type="text/javascript">
// <![CDATA[
if (typeof(Zenbox) !== "undefined") {
Zenbox.init({
dropboxID: "20139974",
url: "https://unimelbit.zendesk.com",
tabTooltip: "Feedback",
tabImageURL: "https://assets.zendesk.com/external/zenbox/images/tab_feedback_right.png",
tabColor: "black",
tabPosition: "Right",
hide_tab: "true",
});
}
// ]]>
</script>