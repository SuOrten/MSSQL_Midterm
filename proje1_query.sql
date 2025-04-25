SELECT TOP 20
    r.session_id,
    s.login_name,
    r.status,
    r.command,
    r.cpu_time
FROM sys.dm_exec_requests r
JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
WHERE r.cpu_time > 0
ORDER BY r.cpu_time DESC;

SELECT TOP 20
    r.session_id,
    s.login_name,
    r.status,
    r.command,
    r.cpu_time
FROM sys.dmrequests r
JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
WHERE r.cpu_time > 0
ORDER BY r.cpu_time DESC;
