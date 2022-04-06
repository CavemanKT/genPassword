extends Control

var length: int = 0
var chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ':', "!", '?', '@', '#', '`', '~', '$', '%', '^', '&', '*', '(', ')']
var genwant: int = 0
var gencount: int = 0
var password: String = ""
var arr: Array = []

func _ready():
#	OS.window_size.x = 500
#	OS.window_size.y = 500
#	OS.window_resizable()
	$GenerateButton.connect('pressed', self, '_on_generate_pressed')
	$Amount.connect('text_changed', self, '_on_amount_changed')
	$Length.connect('text_changed', self, '_on_length_changed')


func _on_GenerateButton_pressed():
	$Length.text = ''
	$Amount.text = ''
	$Passwords.text = ''
	generate(length, genwant)

func _on_amount_changed(new_text):
	genwant = int(new_text)

func _on_length_changed(new_text):
	length = int(new_text)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
	

func generate(length:int, amount:int):
	while gencount < amount:
		randomize()
		password= ""
		while password.length() < length: 
			var select = randi() % chars.size()
			var UL = randi() % 2 + 1
			if UL == 1:
				password += chars[select].to_upper()
			else:
				password += chars[select].to_lower()
		gencount += 1
		$Passwords.add_text(password)
		$Passwords.newline()
		$Passwords.newline()
	gencount = 0
	
