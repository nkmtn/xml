<test>
{
    let $doc := doc('test2.xml')
    for $task in count($doc/test/topics/topic/tasks/task/answers[count(answer ) > 2]//ancestor::task) 
    return $task
}
</test>  
