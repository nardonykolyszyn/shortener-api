# Shortener API

## Usage

### Shorten an URL
```
  POST /api/v1/links/shorten
```
Attributes

```json
{
    "response": {
        "id": "a69a1a3bd20d4dc1b8870b140345071d",
        "title": "Link yw7w63",
        "slashtag": "yw7w63",
        "destination": "http://google.com",
        "created_at": "2019-03-11T13:47:25.000Z",
        "updated_at": "2019-03-11T13:47:25.000Z",
        "status": "active",
        "tags": [],
        "clicks": 0,
        "is_public": false,
        "short_url": "rebrand.ly/yw7w63",
        "domain_id": "8f104cc5b6ee4a4ba7897b06ac2ddcfb",
        "domain_name": "rebrand.ly",
        "domain": {
            "id": "8f104cc5b6ee4a4ba7897b06ac2ddcfb",
            "ref": "/domains/8f104cc5b6ee4a4ba7897b06ac2ddcfb",
            "full_name": "rebrand.ly",
            "active": true
        },
        "https": true,
        "favourite": false,
        "creator": {
            "id": "740f7dd992ba4468a34ae0c37ed29065",
            "full_name": "Nardo Nykolyszyn",
            "avatar_url": "https://s.gravatar.com/avatar/aa5785316146a4f2e9540311033ef9ac?size=80&d=retro&rating=g"
        }
    },
    "status": "ok"
}
```
### Get all shortened URLs

```
  GET /api/v1/links
```