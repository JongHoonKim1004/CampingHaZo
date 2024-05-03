<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<script src="/resources/public/graindashboard/js/graindashboard.js"></script>
<script src="/resources/public/graindashboard/js/graindashboard.vendor.js"></script>

<!-- DEMO CHARTS -->
<script src="/resources/public/demo/resizeSensor.js"></script>
<script src="/resources/public/demo/chartist.js"></script>
<script src="/resources/public/demo/chartist-plugin-tooltip.js"></script>
<script src="/resources/public/demo/gd.chartist-area.js"></script>
<script src="/resources/public/demo/gd.chartist-bar.js"></script>
<script src="/resources/public/demo/gd.chartist-donut.js"></script>
<script>
    $.GDCore.components.GDChartistArea.init('.js-area-chart');
    $.GDCore.components.GDChartistBar.init('.js-bar-chart');
    $.GDCore.components.GDChartistDonut.init('.js-donut-chart');
</script>
</body>
</html>