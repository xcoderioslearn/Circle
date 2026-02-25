extends MeshInstance3D

func _ready():
	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = PackedVector3Array()
	arrays[Mesh.ARRAY_COLOR] = PackedColorArray()
	
	var steps := 18
	var angle_step := TAU / steps
	for i in steps:
		arrays[Mesh.ARRAY_VERTEX].push_back(Vector3.ZERO)
		arrays[Mesh.ARRAY_VERTEX].push_back(Vector3.LEFT.rotated(Vector3.UP, angle_step * i))
		arrays[Mesh.ARRAY_VERTEX].push_back(Vector3.LEFT.rotated(Vector3.UP, angle_step * (i + 1)))
		if i%3 == 0:
			var color := Color.WHITE
			arrays[Mesh.ARRAY_COLOR].append_array([color, color, color])
		elif i%2 == 0: 
			var color := Color.from_hsv(randf(), 0.8, randf())
			arrays[Mesh.ARRAY_COLOR].append_array([color, color, color])
			arrays[Mesh.ARRAY_COLOR].append_array([color, color, color])
		elif  i%1 == 0 and i%3 != 0:
			pass

	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
