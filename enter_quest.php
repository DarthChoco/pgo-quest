<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<?php
	header('Content-Type: text/html; charset=utf-8');
?>
Auswahl des Pokestops, der Anzahl für die Quest und der Quest, z.B. Drehe 3 Pokestops. 3 wählen und Drehe [ANZAHL] Pokestops.
<br>
Auswahl der Belohnung, bei Auswahl von Sternenstaub als Belohnung wird die Anzahl mit 100 multipliziert, d.h. für 200 Sternenstaub, die Anzahl 2 wählen.
<br>
<?php
	//MIT EIGENEN WERTEN ERSETZEN
	$con=mysqli_connect("HOST","USER","PASS","DATABASE");
	$token = "TELEGRAM BOT TOKEN";
	$chatid = "TELEGRAM KANAL ID";
	mysqli_set_charset($con, 'utf8');
	$today = date("Y-m-d");
	if (!empty($_POST)){
		$quest_count = $_POST['quest_count'];
		$quest = "";
		$pokestop = "";
		$reward_count = $_POST['reward_count'];
		$reward = "";
		
		$sql = "INSERT INTO actual_quests (quest_count, quest, pokestop, reward_count, reward, day, user) VALUES ('".$_POST['quest_count']."', '".$_POST['quest']."', '".$_POST['pokestop']."', '".$_POST['reward_count']."', '".$_POST['reward']."', '".$today."', '".$_SERVER['REMOTE_ADDR']."')";
		mysqli_query($con, $sql);
		
		$sql="SELECT name, location FROM pokestops WHERE id = '".$_POST['pokestop']."'";
		$result=mysqli_query($con,$sql);
		$row = mysqli_fetch_assoc($result);
		$pokestop = $row['name'];
		$pokestop_loc = explode(",", $row['location']);
		$pokestop_loc[1] = trim($pokestop_loc[1], " ");
		
		if ($quest_count == 1){
			$sql="SELECT quest FROM quests WHERE id = '".$_POST['quest']."'";
			$result = mysqli_query($con,$sql);
			$row = mysqli_fetch_assoc($result);
			$quest = $row['quest'];
		}else{
			$sql="SELECT quest_multi FROM quests WHERE id = '".$_POST['quest']."'";
			$result = mysqli_query($con,$sql);
			$row = mysqli_fetch_assoc($result);
			$quest = str_replace("[ANZAHL]", $quest_count, $row['quest_multi']);
		}
		
		$sql="SELECT reward FROM reward WHERE id = '".$_POST['reward']."'";
		$result = mysqli_query($con,$sql);
		$row = mysqli_fetch_assoc($result);
		if($row['reward'] == "Sternenstaub"){
			$reward_count = $reward_count * 100;
		}
		$reward = $reward_count.' '.$row['reward'];
		
		
		$message .= sprintf("Quest: %s\n", $quest);
		$message .= sprintf("Pokestop: %s\n", $pokestop);
		$message .= sprintf("Belohnung: %s\n", $reward);
		$message .= 'http://maps.google.com/maps?q=' . $pokestop_loc[0] . ',' . $pokestop_loc[1];

		sendMessage($chatid, $message, $token);
	}
?>
<form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?> method="post">
	<table>
		<tr>
			<td>
				<label>Pokestop:</label>
			</td>
			<td colspan="2">
				<select name="pokestop">
<?php
	$sql="SELECT * FROM pokestops AS t1 WHERE t1.id NOT IN (SELECT t2.pokestop FROM actual_quests AS t2 WHERE t2.pokestop IS NOT NULL AND day = '".$today."') ORDER BY name";
	echo $sql;
	$result=mysqli_query($con,$sql);
	while ($row = mysqli_fetch_assoc($result)) {
		echo '<option value="'.$row["id"].'">'.$row["name"].'</option>';
	}
	mysqli_free_result($result);
?>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label>Quest:</label>
			</td>
			<td>
				<select name="quest_count">
				<?php
					for ($i = 1; $i <= 20; $i++) {
					echo '<option>'.$i.'</option>';
					}
				?>
				</select>
			</td>
			<td>
				<select name="quest">
<?php
	$sql="SELECT * FROM quests ORDER BY quest";
	$result=mysqli_query($con,$sql);
	while ($row = mysqli_fetch_assoc($result)) {
		echo '<option value="'.$row["id"].'">'.$row["quest_multi"].'</option>';
	}
	mysqli_free_result($result);
	
?>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label>Belohnung:</label>
			</td>
			<td>
				<select name="reward_count">
				<?php
					for ($i = 1; $i <= 20; $i++) {
					echo '<option>'.$i.'</option>';
					}
				?>
				</select>
			</td>
			<td>
				<select name="reward">
<?php
	$sql="SELECT * FROM reward ORDER BY reward";
	$result=mysqli_query($con,$sql);
	
	while ($row = mysqli_fetch_assoc($result)) {
		echo '<option value="'.$row["id"].'">'.$row["reward"].'</option>';
	}
	
	mysqli_free_result($result);
	
	mysqli_close($con);
?>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" id="eintragen">Eintragen</button>
			</td>
		</tr>
	</table>
</form>

<?php
	function sendMessage($chatID, $messaggio, $token) {
		$url = "https://api.telegram.org/" . $token . "/sendMessage?chat_id=" . $chatID;
		$url = $url . "&text=" . urlencode($messaggio);
		$ch = curl_init();
		$optArray = array(
				CURLOPT_URL => $url,
				CURLOPT_RETURNTRANSFER => true
		);
		curl_setopt_array($ch, $optArray);
		$result = curl_exec($ch);
		curl_close($ch);
	}
?>