vim.lsp.commands['intellij.jvm.runMain'] = function(command, ctx)
  local args = command.arguments[1]
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local root = client and client.root_dir or vim.fn.getcwd()

  if not args.noDebug then
    return vim.notify('Debug not implemented yet (mainClass: ' .. args.mainClass .. ')')
  end

  local function has(name)
    return vim.uv.fs_stat(vim.fs.joinpath(root, name)) ~= nil
  end

  local cmd
  if has('gradlew') then
    cmd = { './gradlew', 'bootRun' }
  elseif has('mvnw') then
    cmd = { './mvnw', 'spring-boot:run' }
  elseif has('build.gradle.kts') or has('build.gradle') then
    cmd = { 'gradle', 'bootRun' }
  elseif has('pom.xml') then
    cmd = { 'mvn', 'spring-boot:run' }
  else
    return vim.notify(
      ('No build tool found in %s (tool=%s)'):format(root, tostring(args.tool)),
      vim.log.levels.WARN
    )
  end

  vim.cmd('botright 15new')
  vim.fn.jobstart(cmd, { term = true, cwd = root })
  vim.cmd.startinsert()
end
