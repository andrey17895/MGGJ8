extends Location



	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("finish entered")
	_finish_adventure()
