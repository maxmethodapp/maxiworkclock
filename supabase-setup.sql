-- METHOD. Work Clock — run this once in Supabase → SQL Editor

create table if not exists public.workclock (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.workclock enable row level security;

create policy "own row only" on public.workclock
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
