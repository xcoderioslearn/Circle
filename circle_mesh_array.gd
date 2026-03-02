extends MeshInstance3D

func _ready() -> void:
	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)
	var my_vertices = PackedVector3Array()
	var my_colors = PackedColorArray()
	
	var point := Vector3.RIGHT
	var steps := 18
	var angle_step := TAU / steps
	for i in steps :
		my_vertices.append(Vector3.ZERO)
		point = Vector3.LEFT.rotated(Vector3.UP, angle_step * i)
		my_vertices.append(point)
		point = (Vector3.LEFT.rotated(Vector3.UP, angle_step * (i + 1)))
		my_vertices.append(point)
		var color := Color.from_hsv(randf(), 0.8, randf())
		my_colors.append(color)
		my_colors.append(color)
		my_colors.append(color)

	surface_array[Mesh.ARRAY_VERTEX] = my_vertices
	surface_array[Mesh.ARRAY_COLOR] = my_colors
	  
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
