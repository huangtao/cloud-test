.class public Lcom/boyaa/engine/made/APNUtil;
.super Ljava/lang/Object;
.source "APNUtil.java"


# static fields
.field public static final ANP_NAME_CMNET:Ljava/lang/String; = "cmnet"

.field public static final ANP_NAME_CMWAP:Ljava/lang/String; = "cmwap"

.field public static final ANP_NAME_CTNET:Ljava/lang/String; = "\u4e2d\u56fd\u7535\u4fe1ctnet\u670d\u52a1\u5668\u5217\u8868"

.field public static final ANP_NAME_CTWAP:Ljava/lang/String; = "\u4e2d\u56fd\u7535\u4fe1ctwap\u670d\u52a1\u5668\u5217\u8868"

.field public static final ANP_NAME_NET:Ljava/lang/String; = "net"

.field public static final ANP_NAME_NONE:Ljava/lang/String; = "none"

.field public static final ANP_NAME_UNINET:Ljava/lang/String; = "uninet"

.field public static final ANP_NAME_UNIWAP:Ljava/lang/String; = "uniwap"

.field public static final ANP_NAME_WAP:Ljava/lang/String; = "wap"

.field public static final ANP_NAME_WIFI:Ljava/lang/String; = "wifi"

.field public static final APNTYPE_CMNET:B = 0x1t

.field public static final APNTYPE_CMWAP:B = 0x2t

.field public static final APNTYPE_CTNET:B = 0x8t

.field public static final APNTYPE_CTWAP:B = 0x9t

.field public static final APNTYPE_NET:B = 0x6t

.field public static final APNTYPE_NONE:B = 0x0t

.field public static final APNTYPE_UNINET:B = 0x4t

.field public static final APNTYPE_UNIWAP:B = 0x5t

.field public static final APNTYPE_WAP:B = 0x7t

.field public static final APNTYPE_WIFI:B = 0x3t

.field public static final APN_PROP_APN:Ljava/lang/String; = "apn"

.field public static final APN_PROP_PORT:Ljava/lang/String; = "port"

.field public static final APN_PROP_PROXY:Ljava/lang/String; = "proxy"

.field public static final JCE_APNTYPE_CMNET:I = 0x2

.field public static final JCE_APNTYPE_CMWAP:I = 0x4

.field public static final JCE_APNTYPE_CTNET:I = 0x100

.field public static final JCE_APNTYPE_CTWAP:I = 0x200

.field public static final JCE_APNTYPE_DEFAULT:I = 0x1

.field public static final JCE_APNTYPE_NET:I = 0x40

.field public static final JCE_APNTYPE_UNINET:I = 0x10

.field public static final JCE_APNTYPE_UNIWAP:I = 0x20

.field public static final JCE_APNTYPE_UNKNOWN:I = 0x0

.field public static final JCE_APNTYPE_WAP:I = 0x80

.field public static final JCE_APNTYPE_WIFI:I = 0x8

.field public static final MPROXYTYPE_CMNET:I = 0x4

.field public static final MPROXYTYPE_CMWAP:I = 0x1

.field public static final MPROXYTYPE_CTNET:I = 0x100

.field public static final MPROXYTYPE_CTWAP:I = 0x200

.field public static final MPROXYTYPE_DEFAULT:I = 0x80

.field public static final MPROXYTYPE_NET:I = 0x20

.field public static final MPROXYTYPE_UNINET:I = 0x8

.field public static final MPROXYTYPE_UNIWAP:I = 0x10

.field public static final MPROXYTYPE_WAP:I = 0x40

.field public static final MPROXYTYPE_WIFI:I = 0x2

.field private static PREFERRED_APN_URI:Landroid/net/Uri; = null

.field private static final TAG:Ljava/lang/String; = "APNUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 68
    const-string v0, "content://telephony/carriers/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/boyaa/engine/made/APNUtil;->PREFERRED_APN_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static IsBroadband(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 233
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getMProxyType(Landroid/content/Context;)I

    move-result v0

    .line 234
    .local v0, "netType":I
    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    .line 253
    :cond_0
    :goto_0
    return v1

    .line 236
    :cond_1
    if-ne v0, v1, :cond_2

    move v1, v2

    .line 237
    goto :goto_0

    .line 238
    :cond_2
    const/4 v3, 0x4

    if-ne v0, v3, :cond_3

    move v1, v2

    .line 239
    goto :goto_0

    .line 240
    :cond_3
    const/16 v3, 0x10

    if-ne v0, v3, :cond_4

    move v1, v2

    .line 241
    goto :goto_0

    .line 242
    :cond_4
    const/16 v3, 0x8

    if-ne v0, v3, :cond_5

    move v1, v2

    .line 243
    goto :goto_0

    .line 244
    :cond_5
    const/16 v3, 0x40

    if-ne v0, v3, :cond_6

    move v1, v2

    .line 245
    goto :goto_0

    .line 246
    :cond_6
    const/16 v3, 0x20

    if-ne v0, v3, :cond_7

    move v1, v2

    .line 247
    goto :goto_0

    .line 248
    :cond_7
    const/16 v3, 0x200

    if-ne v0, v3, :cond_8

    move v1, v2

    .line 249
    goto :goto_0

    .line 250
    :cond_8
    const/16 v3, 0x100

    if-ne v0, v3, :cond_0

    move v1, v2

    .line 251
    goto :goto_0
.end method

.method public static getApn(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    .line 295
    const/4 v6, 0x0

    .line 296
    .local v6, "apn":Ljava/lang/String;
    const/4 v7, 0x0

    .line 298
    .local v7, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/boyaa/engine/made/APNUtil;->PREFERRED_APN_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 300
    if-eqz v7, :cond_2

    .line 301
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 302
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 310
    if-eqz v7, :cond_0

    .line 312
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    :cond_0
    :goto_0
    move-object v0, v8

    .line 318
    :goto_1
    return-object v0

    .line 305
    :cond_1
    :try_start_2
    const-string v0, "apn"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    .line 310
    :cond_2
    if-eqz v7, :cond_3

    .line 312
    :try_start_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :cond_3
    :goto_2
    move-object v0, v6

    .line 318
    goto :goto_1

    .line 310
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_4

    .line 312
    :try_start_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 310
    :cond_4
    :goto_3
    throw v0

    .line 307
    :catch_0
    move-exception v0

    .line 310
    if-eqz v7, :cond_3

    .line 312
    :try_start_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 313
    :catch_1
    move-exception v0

    goto :goto_2

    .line 308
    :catch_2
    move-exception v0

    .line 310
    if-eqz v7, :cond_3

    .line 312
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 313
    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v0

    goto :goto_0
.end method

.method public static getApnName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 204
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getMProxyType(Landroid/content/Context;)I

    move-result v1

    .line 206
    .local v1, "netType":I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 207
    const-string v0, "wifi"

    .line 229
    :cond_0
    :goto_0
    return-object v0

    .line 208
    :cond_1
    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 209
    const-string v0, "cmwap"

    goto :goto_0

    .line 210
    :cond_2
    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 211
    const-string v0, "cmnet"

    goto :goto_0

    .line 212
    :cond_3
    const/16 v2, 0x10

    if-ne v1, v2, :cond_4

    .line 213
    const-string v0, "uniwap"

    goto :goto_0

    .line 214
    :cond_4
    const/16 v2, 0x8

    if-ne v1, v2, :cond_5

    .line 215
    const-string v0, "uninet"

    goto :goto_0

    .line 216
    :cond_5
    const/16 v2, 0x40

    if-ne v1, v2, :cond_6

    .line 217
    const-string v0, "wap"

    goto :goto_0

    .line 218
    :cond_6
    const/16 v2, 0x20

    if-ne v1, v2, :cond_7

    .line 219
    const-string v0, "net"

    goto :goto_0

    .line 220
    :cond_7
    const/16 v2, 0x200

    if-ne v1, v2, :cond_8

    .line 221
    const-string v0, "\u4e2d\u56fd\u7535\u4fe1ctwap\u670d\u52a1\u5668\u5217\u8868"

    goto :goto_0

    .line 222
    :cond_8
    const/16 v2, 0x100

    if-ne v1, v2, :cond_9

    .line 223
    const-string v0, "\u4e2d\u56fd\u7535\u4fe1ctnet\u670d\u52a1\u5668\u5217\u8868"

    goto :goto_0

    .line 226
    :cond_9
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getApn(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 227
    .local v0, "apn":Ljava/lang/String;
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 229
    :cond_a
    const-string v0, "none"

    goto :goto_0
.end method

.method public static getApnPort(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    .line 367
    const/4 v6, 0x0

    .line 368
    .local v6, "c":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 370
    .local v7, "value":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/boyaa/engine/made/APNUtil;->PREFERRED_APN_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 372
    if-eqz v6, :cond_2

    .line 373
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 374
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 382
    if-eqz v6, :cond_0

    .line 384
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    :cond_0
    :goto_0
    move-object v0, v8

    .line 390
    :goto_1
    return-object v0

    .line 377
    :cond_1
    :try_start_2
    const-string v0, "proxy"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v7

    .line 382
    :cond_2
    if-eqz v6, :cond_3

    .line 384
    :try_start_3
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :cond_3
    :goto_2
    move-object v0, v7

    .line 390
    goto :goto_1

    .line 382
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 384
    :try_start_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 382
    :cond_4
    :goto_3
    throw v0

    .line 379
    :catch_0
    move-exception v0

    .line 382
    if-eqz v6, :cond_3

    .line 384
    :try_start_5
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 385
    :catch_1
    move-exception v0

    goto :goto_2

    .line 380
    :catch_2
    move-exception v0

    .line 382
    if-eqz v6, :cond_3

    .line 384
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 385
    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v0

    goto :goto_0
.end method

.method public static getApnPortInt(Landroid/content/Context;)I
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v9, 0x50

    const/4 v10, -0x1

    .line 400
    const/4 v6, 0x0

    .line 401
    .local v6, "c":Landroid/database/Cursor;
    const/4 v8, -0x1

    .line 403
    .local v8, "port":I
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/boyaa/engine/made/APNUtil;->PREFERRED_APN_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 405
    if-eqz v6, :cond_1

    .line 406
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 407
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 408
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I

    move-result v0

    if-ne v0, v10, :cond_3

    move v8, v9

    .line 411
    :cond_0
    :goto_0
    const-string v0, "port"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    .line 420
    :cond_1
    if-eqz v6, :cond_2

    .line 422
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 428
    :cond_2
    :goto_1
    return v8

    .line 408
    :cond_3
    :try_start_2
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v8

    goto :goto_0

    .line 413
    :catch_0
    move-exception v7

    .line 415
    .local v7, "e":Ljava/lang/SecurityException;
    :try_start_3
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v0

    if-ne v0, v10, :cond_4

    move v8, v9

    .line 420
    :goto_2
    if-eqz v6, :cond_2

    .line 422
    :try_start_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 423
    .end local v7    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    goto :goto_1

    .line 415
    .restart local v7    # "e":Ljava/lang/SecurityException;
    :cond_4
    :try_start_5
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I

    move-result v8

    goto :goto_2

    .line 416
    .end local v7    # "e":Ljava/lang/SecurityException;
    :catch_2
    move-exception v7

    .line 418
    .local v7, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v0

    if-ne v0, v10, :cond_5

    move v8, v9

    .line 420
    :goto_3
    if-eqz v6, :cond_2

    .line 422
    :try_start_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    .line 418
    :cond_5
    :try_start_7
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v8

    goto :goto_3

    .line 420
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_6

    .line 422
    :try_start_8
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 420
    :cond_6
    :goto_4
    throw v0

    .line 423
    :catch_3
    move-exception v1

    goto :goto_4
.end method

.method public static getApnProxy(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 329
    const/4 v6, 0x0

    .line 330
    .local v6, "c":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 332
    .local v8, "proxy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/boyaa/engine/made/APNUtil;->PREFERRED_APN_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 334
    if-eqz v6, :cond_2

    .line 335
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 336
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v8

    .line 339
    :cond_0
    const-string v0, "proxy"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 349
    :goto_0
    if-eqz v6, :cond_1

    .line 351
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 357
    :cond_1
    :goto_1
    return-object v8

    .line 341
    :cond_2
    :try_start_2
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v8

    goto :goto_0

    .line 343
    :catch_0
    move-exception v7

    .line 344
    .local v7, "e":Ljava/lang/SecurityException;
    :try_start_3
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v8

    .line 349
    if-eqz v6, :cond_1

    .line 351
    :try_start_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 352
    .end local v7    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    goto :goto_1

    .line 345
    :catch_2
    move-exception v7

    .line 347
    .local v7, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v8

    .line 349
    if-eqz v6, :cond_1

    .line 351
    :try_start_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    .line 349
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 351
    :try_start_7
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 349
    :cond_3
    :goto_2
    throw v0

    .line 352
    :catch_3
    move-exception v1

    goto :goto_2
.end method

.method public static getApnType(Landroid/content/Context;)B
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x4

    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 264
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getMProxyType(Landroid/content/Context;)I

    move-result v0

    .line 266
    .local v0, "netType":I
    if-ne v0, v1, :cond_1

    .line 267
    const/4 v1, 0x3

    .line 285
    :cond_0
    :goto_0
    return v1

    .line 268
    :cond_1
    if-eq v0, v2, :cond_0

    .line 270
    if-ne v0, v3, :cond_2

    move v1, v2

    .line 271
    goto :goto_0

    .line 272
    :cond_2
    const/16 v1, 0x10

    if-ne v0, v1, :cond_3

    .line 273
    const/4 v1, 0x5

    goto :goto_0

    .line 274
    :cond_3
    if-ne v0, v4, :cond_4

    move v1, v3

    .line 275
    goto :goto_0

    .line 276
    :cond_4
    const/16 v1, 0x40

    if-ne v0, v1, :cond_5

    .line 277
    const/4 v1, 0x7

    goto :goto_0

    .line 278
    :cond_5
    const/16 v1, 0x20

    if-ne v0, v1, :cond_6

    .line 279
    const/4 v1, 0x6

    goto :goto_0

    .line 280
    :cond_6
    const/16 v1, 0x200

    if-ne v0, v1, :cond_7

    .line 281
    const/16 v1, 0x9

    goto :goto_0

    .line 282
    :cond_7
    const/16 v1, 0x100

    if-ne v0, v1, :cond_8

    move v1, v4

    .line 283
    goto :goto_0

    .line 285
    :cond_8
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getJceApnType(Landroid/content/Context;)I
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v4, 0x10

    const/16 v1, 0x8

    const/4 v2, 0x4

    const/4 v3, 0x2

    const/4 v5, 0x1

    .line 108
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getMProxyType(Landroid/content/Context;)I

    move-result v0

    .line 109
    .local v0, "netType":I
    if-ne v0, v3, :cond_0

    .line 128
    :goto_0
    return v1

    .line 111
    :cond_0
    if-ne v0, v5, :cond_1

    move v1, v2

    .line 112
    goto :goto_0

    .line 113
    :cond_1
    if-ne v0, v2, :cond_2

    move v1, v3

    .line 114
    goto :goto_0

    .line 115
    :cond_2
    if-ne v0, v4, :cond_3

    .line 116
    const/16 v1, 0x20

    goto :goto_0

    .line 117
    :cond_3
    if-ne v0, v1, :cond_4

    move v1, v4

    .line 118
    goto :goto_0

    .line 119
    :cond_4
    const/16 v1, 0x40

    if-ne v0, v1, :cond_5

    .line 120
    const/16 v1, 0x80

    goto :goto_0

    .line 121
    :cond_5
    const/16 v1, 0x20

    if-ne v0, v1, :cond_6

    .line 122
    const/16 v1, 0x40

    goto :goto_0

    .line 123
    :cond_6
    const/16 v1, 0x200

    if-ne v0, v1, :cond_7

    .line 124
    const/16 v1, 0x200

    goto :goto_0

    .line 125
    :cond_7
    const/16 v1, 0x100

    if-ne v0, v1, :cond_8

    .line 126
    const/16 v1, 0x100

    goto :goto_0

    :cond_8
    move v1, v5

    .line 128
    goto :goto_0
.end method

.method public static getMProxyType(Landroid/content/Context;)I
    .locals 8
    .param p0, "act"    # Landroid/content/Context;

    .prologue
    .line 458
    const/16 v4, 0x80

    .line 459
    .local v4, "type":I
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 461
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 462
    .local v2, "info":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    .line 463
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v5

    .line 464
    .local v5, "typeName":Ljava/lang/String;
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v1

    .line 465
    .local v1, "extraInfo":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 466
    const-string v1, "unknown"

    .line 471
    :goto_0
    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "WIFI"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 472
    const/4 v4, 0x2

    .line 503
    .end local v1    # "extraInfo":Ljava/lang/String;
    .end local v5    # "typeName":Ljava/lang/String;
    :cond_0
    :goto_1
    return v4

    .line 468
    .restart local v1    # "extraInfo":Ljava/lang/String;
    .restart local v5    # "typeName":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 474
    :cond_2
    const-string v6, "cmwap"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 475
    const/4 v4, 0x1

    goto :goto_1

    .line 476
    :cond_3
    const-string v6, "cmnet"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    const-string v6, "epc.tmobile.com"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 478
    :cond_4
    const/4 v4, 0x4

    goto :goto_1

    .line 479
    :cond_5
    const-string v6, "uniwap"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 480
    const/16 v4, 0x10

    goto :goto_1

    .line 481
    :cond_6
    const-string v6, "uninet"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 482
    const/16 v4, 0x8

    goto :goto_1

    .line 483
    :cond_7
    const-string v6, "wap"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 484
    const/16 v4, 0x40

    goto :goto_1

    .line 485
    :cond_8
    const-string v6, "net"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 486
    const/16 v4, 0x20

    goto :goto_1

    .line 487
    :cond_9
    const-string v6, "#777"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 488
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getApnProxy(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 489
    .local v3, "proxy":Ljava/lang/String;
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_a

    .line 490
    const/16 v4, 0x200

    goto :goto_1

    .line 492
    :cond_a
    const/16 v4, 0x100

    goto :goto_1

    .line 494
    .end local v3    # "proxy":Ljava/lang/String;
    :cond_b
    const-string v6, "ctwap"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 495
    const/16 v4, 0x200

    goto :goto_1

    .line 496
    :cond_c
    const-string v6, "ctnet"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 497
    const/16 v4, 0x100

    goto :goto_1
.end method

.method public static getNetWorkName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 511
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 513
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 514
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    .line 515
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v2

    .line 517
    :goto_0
    return-object v2

    :cond_0
    const-string v2, "MOBILE"

    goto :goto_0
.end method

.method public static hasProxy(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 438
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->getMProxyType(Landroid/content/Context;)I

    move-result v0

    .line 441
    .local v0, "netType":I
    if-eq v0, v1, :cond_0

    const/16 v2, 0x10

    if-eq v0, v2, :cond_0

    const/16 v2, 0x40

    if-eq v0, v2, :cond_0

    const/16 v2, 0x200

    if-ne v0, v2, :cond_1

    .line 445
    :cond_0
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isActiveNetworkAvailable(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 542
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 544
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 545
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    .line 546
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    .line 547
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 4
    .param p0, "act"    # Landroid/content/Context;

    .prologue
    .line 527
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 529
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 530
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v2, v3, :cond_0

    .line 531
    const/4 v2, 0x1

    .line 532
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static jceApnTypeToNormalapnType(I)B
    .locals 5
    .param p0, "jceApnType"    # I

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x4

    .line 138
    if-nez p0, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v0

    .line 140
    :cond_1
    if-ne p0, v2, :cond_2

    move v0, v1

    .line 141
    goto :goto_0

    .line 142
    :cond_2
    if-ne p0, v3, :cond_3

    move v0, v2

    .line 143
    goto :goto_0

    .line 144
    :cond_3
    if-ne p0, v1, :cond_4

    move v0, v3

    .line 145
    goto :goto_0

    .line 146
    :cond_4
    if-ne p0, v4, :cond_5

    .line 147
    const/4 v0, 0x3

    goto :goto_0

    .line 148
    :cond_5
    const/16 v2, 0x10

    if-ne p0, v2, :cond_6

    move v0, v1

    .line 149
    goto :goto_0

    .line 150
    :cond_6
    const/16 v1, 0x20

    if-ne p0, v1, :cond_7

    .line 151
    const/4 v0, 0x5

    goto :goto_0

    .line 152
    :cond_7
    const/16 v1, 0x40

    if-ne p0, v1, :cond_8

    .line 153
    const/4 v0, 0x6

    goto :goto_0

    .line 154
    :cond_8
    const/16 v1, 0x80

    if-ne p0, v1, :cond_9

    .line 155
    const/4 v0, 0x7

    goto :goto_0

    .line 156
    :cond_9
    const/16 v1, 0x200

    if-ne p0, v1, :cond_a

    move v0, v4

    .line 157
    goto :goto_0

    .line 158
    :cond_a
    const/16 v1, 0x100

    if-ne p0, v1, :cond_0

    .line 159
    const/16 v0, 0x9

    goto :goto_0
.end method

.method public static normalApnTypeToJceApnType(B)I
    .locals 5
    .param p0, "apnType"    # B

    .prologue
    const/16 v4, 0x8

    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v3, 0x4

    .line 171
    if-nez p0, :cond_1

    .line 194
    :cond_0
    :goto_0
    return v0

    .line 173
    :cond_1
    if-ne p0, v3, :cond_2

    move v0, v1

    .line 174
    goto :goto_0

    .line 175
    :cond_2
    if-ne p0, v1, :cond_3

    move v0, v2

    .line 176
    goto :goto_0

    .line 177
    :cond_3
    if-ne p0, v2, :cond_4

    move v0, v3

    .line 178
    goto :goto_0

    .line 179
    :cond_4
    const/4 v1, 0x3

    if-ne p0, v1, :cond_5

    move v0, v4

    .line 180
    goto :goto_0

    .line 181
    :cond_5
    if-ne p0, v3, :cond_6

    .line 182
    const/16 v0, 0x10

    goto :goto_0

    .line 183
    :cond_6
    const/4 v1, 0x5

    if-ne p0, v1, :cond_7

    .line 184
    const/16 v0, 0x20

    goto :goto_0

    .line 185
    :cond_7
    const/4 v1, 0x6

    if-ne p0, v1, :cond_8

    .line 186
    const/16 v0, 0x40

    goto :goto_0

    .line 187
    :cond_8
    const/4 v1, 0x7

    if-ne p0, v1, :cond_9

    .line 188
    const/16 v0, 0x80

    goto :goto_0

    .line 189
    :cond_9
    const/16 v1, 0x9

    if-ne p0, v1, :cond_a

    .line 190
    const/16 v0, 0x200

    goto :goto_0

    .line 191
    :cond_a
    if-ne p0, v4, :cond_0

    .line 192
    const/16 v0, 0x100

    goto :goto_0
.end method
