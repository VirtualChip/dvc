
echo "<table id=report>"
echo "<tr class=header><td colspan=3><h2>[$project]/$dvc_path/</h2></td></tr>"

echo "<tr class=title><b>"
echo "<td>Block</td>"
echo "<td>README</td>"
echo "<td>STATUS</td>"
echo "</b></tr>"

echo "<tr class=data>"
echo "<td class=col1>"
echo "<a href=../index.htm>"
echo "<b>$dvc_name</b>"
echo "</a>"
echo "</td>" 

echo "<td class=col2>" 
echo "<object name=readme type=text/html data=.dvc/README width=300></object>"
echo "</td>"
 
echo "<td class=col3>"
dvc_get_dqi --root $dvc_data --html --all
echo "</td>" 
echo "</tr>" 

echo "</table>"

