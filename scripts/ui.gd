extends CanvasLayer

var coins = 0


func _ready():
	var coinNode = get_tree().get_root().find_node("coin", true, false)
	#coinNode.connect("coinCollected", self, "handleCoinCollected")
	$monedasCol.text = String(coins)

func handleCoinCollected():
	coins+=1
	$monedasCol.text = String(coins)


