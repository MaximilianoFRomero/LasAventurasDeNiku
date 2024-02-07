extends CanvasLayer

var coins = 0
#var energy = 3
var heart1
var heart2
var heart3
var heart4
var heart5

func _ready():
	
	heart1 = get_node("coin2d2")
	heart2 = get_node("coin2d3")
	heart3 = get_node("coin2d4")
	heart4 = get_node("coin2d5")
	heart5 = get_node("coin2d6")
	heart4.visible = false
	heart5.visible = false
	
	var coinNode = get_tree().get_root().find_node("coin", true, false)
	#coinNode.connect("coinCollected", self, "handleCoinCollected")
	$monedasCol.text = String(coins)

func handleCoinCollected():
	coins+=1
	$monedasCol.text = String(coins)

func handleLifeCollected(energy):
	#energy+=1
	if energy == 1:
		heart1.visible = true
		print("Life add" +str(energy))
	if energy == 2:
		heart2.visible = true
		print("Life add" +str(energy))
	if energy == 3:
		heart3.visible = true
		print("Life add" +str(energy))
	if energy == 4:
		heart4.visible = true
		print("Life add" +str(energy))
	if energy == 5:
		heart5.visible = true
		print("Life add" +str(energy))

func handledHearts(var energy):
	if energy == 0:
		heart3.visible = false
		print("Life rem" +str(energy))
	if energy == 1:
		heart2.visible = false
		print("Life rem" +str(energy))
	if energy == 2:
		heart1.visible = false
		print("Life rem" +str(energy))
	if energy == 3:
		heart4.visible = false
		print("Life rem" +str(energy))
	if energy == 4:
		heart5.visible = false
		print("Life rem" +str(energy))

