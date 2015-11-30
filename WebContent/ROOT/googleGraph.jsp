<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {'packages':['corechart']});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([
				['Mushrooms', 8],
				['Onions', 1],
				['Olives', 1],
				['Zucchini', 1],
				['Pepperoni', 2]
			]);

		// Set chart options
		var options = {'title':'How Much Water I spend', 'legend':'none', 'width':'50%', 'height':'100%' };

		// Instantiate and draw our chart, passing in some options.
		var chart1 = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
		chart1.draw(data, options);

		var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
		chart2.draw(data, options);
	}
</script>

<div id="chart_div1"></div>
<br>
<div id="chart_div2"></div>