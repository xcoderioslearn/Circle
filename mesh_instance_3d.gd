extends MeshInstance3D

func _ready() -> void:
	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)
	
	var start_vector = Vector3(1.0, 0 ,0)
	var current_vector: Vector3
	var rotation_degree_value : float
	var current_step_iteration = 0
	var numbers_of_steps = 360
	
	var my_vertices = PackedVector3Array()
	var my_uvs = PackedVector2Array()
	var my_normals = PackedVector3Array()
	
	rotation_degree_value = 2 * PI / numbers_of_steps
	current_vector = Vector3(start_vector.rotated(Vector3.UP, rotation_degree_value))
	# loop 
	for i in numbers_of_steps:
		my_vertices.push_back(Vector3(current_vector.rotated(Vector3.UP, rotation_degree_value * current_step_iteration)))
		my_uvs.push_back(Vector2(0,0))
		my_normals.push_back(Vector3.UP)
		current_step_iteration += 1
	surface_array[Mesh.ARRAY_VERTEX] = my_vertices
	surface_array[Mesh.ARRAY_TEX_UV] = my_uvs
	surface_array[Mesh.ARRAY_NORMAL] = my_normals
	  
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS, surface_array)
