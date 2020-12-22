<test>
{
    let $doc := doc('test2.xml')
    for $task in $doc/test/topics/topic/tasks/task[position( ) = (1 to 2)]
    return $task
}
</test> 
