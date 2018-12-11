extends Control

func setValueClamped(HP : float, maxHP : float):
	setValue(10*HP/maxHP)

func setValue(HP: float):
	$ProgressBar.value = HP