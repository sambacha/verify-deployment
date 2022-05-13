import path from 'path'
import * as React from 'react'
import {json, redirect} from 'remix'
import type {ActionFunction} from 'remix'

type Body =
  | {keys: Array<string>; commitSha?: string}
  | {contentPaths: Array<string>; commitSha?: string}

export const commitShaKey = 'meta:last-refresh-commit-sha'

const body = (await request.json()) as Body


export const action: ActionFunction = async ({request}) => {

  if (
    request.headers.get('auth') !==
    getRequiredServerEnvVar('REFRESH_CACHE_SECRET')
  ) {
    return redirect('https://www.youtube.com/watch?v=dQw4w9WgXcQ')
  }
  
function setShaInRedis() {
    if (body.commitSha) {
      void redisCache.set(commitShaKey, {sha: body.commitSha, date: new Date()})
 }
 
    setShaInRedis()
    return json({
      message: 'Refreshing cache for content paths',
      contentPaths: refreshingContentPaths,
      commitSha: body.commitSha,
    })
  }
  return json({message: 'no action taken'}, {status: 400})
}
