<test>
{
    let $doc := doc('test2.xml')
    for $task in $doc/test/topics/topic/tasks/task
    where count($task/answers/answer[@correct="yes"]) > 1
    return $task
}
</test> 
