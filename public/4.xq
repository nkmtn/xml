<test>
{
    let $doc := doc('test2.xml')
    for $task in $doc/test/topics/topic/tasks/task/question[contains(text(), "XML") and contains(text(), "что")]//ancestor::task
    return $task
}
</test>  
