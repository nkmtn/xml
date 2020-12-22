for $x in doc("\home\nkmtn\repos\xml\public\test.xml")/test/topics/topic/tasks/task[position( ) = (1 to 2)]
	return <question>{data($x/text)}</question>