<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<?php
	header('Content-Type: text/html; charset=utf-8');
?>
<table border="solid">
	<tr>
		<th>Pokestop</th>
		<th>Quest</th>
		<th>Belohnung</th>
	</tr>
	<tr>
<?php
	$con=mysqli_connect("HOST","USER","PASS","DATABASE");
	mysqli_set_charset($con, 'utf8');
	$today = date("Y-m-d");
	
	$quest_count = $_POST['quest_count'];
	$quest = "";
	$pokestop = "";
	$reward_count = $_POST['reward_count'];
	$reward = "";
	
	$sql="SELECT * FROM actual_quests LEFT JOIN pokestops ON actual_quests.pokestop = pokestops.id WHERE day = '".$today."' ORDER BY pokestops.name";
	$result=mysqli_query($con,$sql);
	// Associative array
	while ($row = mysqli_fetch_assoc($result)) {
		echo '<tr>';
		
		$quest_count = $row['quest_count'];
		$reward_count = $row['reward_count'];
		
		$sql_pokestop="SELECT * FROM pokestops WHERE id = '".$row["pokestop"]."'";
		$result_pokestop=mysqli_query($con,$sql_pokestop);
		$row_pokestop = mysqli_fetch_assoc($result_pokestop);
		echo '<td>'.$row_pokestop["name"].'</td>';
		
		if ($quest_count == 1){
			$sql_quest="SELECT quest FROM quests WHERE id = '".$row['quest']."'";
			$result_quest = mysqli_query($con,$sql_quest);
			$row_quest = mysqli_fetch_assoc($result_quest);
			$quest = $row_quest['quest'];
		}else{
			$sql_quest="SELECT quest_multi FROM quests WHERE id = '".$row['quest']."'";
			$result_quest = mysqli_query($con,$sql_quest);
			$row_quest = mysqli_fetch_assoc($result_quest);
			$quest = str_replace("[ANZAHL]", $quest_count, $row_quest['quest_multi']);
		}
		echo '<td>'.$quest.'</td>';
		
		$sql_reward="SELECT * FROM reward WHERE id = '".$row["reward"]."'";
		$result_reward=mysqli_query($con,$sql_reward);
		$row_reward = mysqli_fetch_assoc($result_reward);
		echo '<td>'.$reward_count.' '.$row_reward["reward"].'</td>';
		
		echo '</tr>';
	}
?>
</table>