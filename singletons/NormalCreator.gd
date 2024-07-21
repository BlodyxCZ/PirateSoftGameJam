@tool
extends MeshInstance3D


func _ready() -> void:
	var vertices = PackedVector3Array()
	var normals = PackedVector3Array()
	var uvs = PackedVector2Array()
	
	var mdt: MeshDataTool = MeshDataTool.new()
	mdt.create_from_surface(mesh, 0)
	
	for face in mdt.get_face_count():
		var normal = mdt.get_face_normal(face)
		for vertex in range(3):
			var faceVertex = mdt.get_face_vertex(face, vertex)
			vertices.push_back(mdt.get_vertex(faceVertex))
			uvs.push_back(mdt.get_vertex_uv(faceVertex))
			normals.push_back(normal)
	
	var properties: Array = []
	properties.resize(ArrayMesh.ARRAY_MAX)
	properties[ArrayMesh.ARRAY_VERTEX] = vertices
	properties[ArrayMesh.ARRAY_NORMAL] = normals
	properties[ArrayMesh.ARRAY_TEX_UV] = uvs
	var array_mesh: ArrayMesh = ArrayMesh.new()
	array_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, properties)
	array_mesh.surface_set_material(0, mdt.get_material())
	
	mesh = array_mesh
