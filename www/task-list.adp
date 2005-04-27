<if @task_list:rowcount@ eq 0>
    <em>No tasks</em>
</if>

<if @task_list:rowcount@ ne 0>
    <table cellspacing="0" cellpadding="0" border="0">
    <tr><td bgcolor="#cccccc">
    
    <table width="100%" cellspacing="1" cellpadding="4" border="0">
    <tr bgcolor="#ffffe4">
    <th>To do</th>	
    <th>On what</th>
    <th>As part of</th>
    
    <if @type@ eq "own">
	<th>Started</th>
    </if>	
    
    <th>Time Estimate</th>
    <th>Deadline</th>
    </tr>
	    
    <multiple name="task_list">
	<tr valign="middle" bgcolor="#eeeeee">
	    <td><a href="@package_url@@task_list.task_url@">@task_list.task_name@</a>
		    
	    <if @task_list.state@ eq "started">
		<if @task_list.holding_user@ not nil>
		    <if @task_list.holding_user_first@ not nil>
			<if @task_list.holding_user_email@ not nil>
			     by <a href="/shared/community-member?user_id=@task_list.holding_user@">@task_list.holding_user_first@ @task_list.holding_user_last@</a> (<a href="mailto:@task_list.holding_user_email@">@task_list.holding_user_email@</a>)
			</if>
		    </if>
		</if>
	    </if>
		    
	    </td>
	    <td>@task_list.object_name@</td>
	    <td>@task_list.workflow_name@</td>
	
	    <if @type@ eq "own">
		<td>
		    <if @task_list.started_date_pretty@ not nil>@task_list.started_date_pretty@</if>
		    <if @task_list.started_date_pretty@ nil>&nbsp;</if>
		</td>
	    </if>
			    
	    <td>
		<if @task_list.estimated_minutes@ not nil>@task_list.estimated_minutes@</if>
		<if @task_list.estimated_minutes@ nil>&nbsp;</if>
	    </td>
	    <td>
		<if @task_list.deadline@ not nil>
		    <if @task_list.days_till_deadline@ le 1>
			<font color=red><strong>@task_list.deadline_pretty@</strong></font>
		    </if>
		    <if @task_list.days_till_deadline@ gt 1>
			@task_list.deadline_pretty@
		    </if>
		</if>
		<if @task_list.deadline@ nil>
		    &nbsp;
		</if>
	    </td>
	</tr>
    </multiple>
    
    </table>
	    
    </td></tr>
    </table>
</if>