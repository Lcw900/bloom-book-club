# Cloudflare deployment

Bloom’s frontend is served as Worker static assets. API requests execute in `worker.mjs`. D1 stores rooms and request-rate counters. The Node development server remains available separately.

1. Install dependencies with `npm install`.
2. Authenticate using `npx wrangler login` and authorize Cloudflare’s official Wrangler tool in your browser.
3. Run `npx wrangler d1 create bloom-meetings`. Copy the returned database ID into `wrangler.jsonc`.
4. Apply the schema with `npx wrangler d1 migrations apply bloom-meetings --remote`.
5. Deploy with `npx wrangler deploy`.
6. Upload `DAILY_API_KEY` and `BLOOM_HOST_PASSWORD` using `npx wrangler secret bulk` via stdin. Do not put values in arguments, config, source control, or browser code.
7. Open the returned HTTPS workers.dev URL. Invitations use that origin automatically; BLOOM_PUBLIC_URL is not required for this backend.

Choose the Workers Paid plan in your account if desired; deploying does not subscribe you automatically. The app itself does not enforce a meeting duration. Daily’s usage allowance and account conditions still apply.

The migration creates fresh tables. Local Node meetings use another format and are not imported automatically. Do not send invitation links until an actual host/member call has been tested. Daily Prebuilt is used for live calls, with a different control layout from the branded demo.
