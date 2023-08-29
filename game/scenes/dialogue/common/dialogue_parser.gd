extends Resource
class_name DialogueParser

static func parse_text(text: String) -> Array[DialogueLine]:
	var lines: Array[DialogueLine] = []
	var parsed_dialogue = JSON.parse_string(text)
	for entry in parsed_dialogue:
		var line = DialogueLine.new()
		line.name = entry["name"]
		line.line = entry["line"]
		line.position = entry["position"]
		line.emotion = entry["emotion"] if entry.has("emotion") else "default"
		lines.append(line)
	return lines
