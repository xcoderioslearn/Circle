extends MeshInstance3D

var t := 1.5

func _ready() -> void:
	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = PackedVector3Array()
	arrays[Mesh.ARRAY_COLOR] = PackedColorArray()

	var circle_steps := 24
	var circle := PackedVector3Array()
	for i in circle_steps:
		circle.push_back(Vector3.ZERO)
		circle.push_back(Vector3.RIGHT.rotated(Vector3.DOWN, i * TAU / circle_steps))
		circle.push_back(Vector3.RIGHT.rotated(Vector3.DOWN, (i + 1) * TAU / circle_steps))
	for n in circle_steps +18:
		circle.remove_at(3)

	var color := PackedColorArray()
	color.resize(circle.size())
	color.fill(Color.WHITE)
	
	
	arrays[Mesh.ARRAY_VERTEX].append_array(circle)
	arrays[Mesh.ARRAY_COLOR].append_array(color)


	var circle_count = 6
	for i in circle_count:
		var transform_circle := Transform3D().translated(Vector3.RIGHT * abs(sin(t))).rotated(Vector3.UP, i * TAU / circle_count)
		arrays[Mesh.ARRAY_VERTEX].append_array(transform_circle * circle)
		color.fill(Color.from_hsv(float(i) / circle_count, 1.0, 0.7))
		arrays[Mesh.ARRAY_COLOR].append_array(color)
	print(arrays[Mesh.ARRAY_VERTEX].size())
	for n in circle_count * 2 +18:
		arrays[Mesh.ARRAY_VERTEX].remove_at(0)
		arrays[Mesh.ARRAY_COLOR].remove_at(0)
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	print(arrays[Mesh.ARRAY_VERTEX])
