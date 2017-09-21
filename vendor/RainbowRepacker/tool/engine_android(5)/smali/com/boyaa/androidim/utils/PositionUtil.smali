.class public Lcom/boyaa/androidim/utils/PositionUtil;
.super Ljava/lang/Object;
.source "PositionUtil.java"


# static fields
.field public static final BAIDU_LBS_TYPE:Ljava/lang/String; = "bd09ll"

.field public static a:D

.field public static ee:D

.field public static pi:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 7
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    sput-wide v0, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    .line 8
    const-wide v0, 0x415854c140000000L    # 6378245.0

    sput-wide v0, Lcom/boyaa/androidim/utils/PositionUtil;->a:D

    .line 9
    const-wide v0, 0x3f7b6a8faf80ef0bL    # 0.006693421622965943

    sput-wide v0, Lcom/boyaa/androidim/utils/PositionUtil;->ee:D

    .line 3
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bd09_To_Gcj02(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 18
    .param p0, "bd_lat"    # D
    .param p2, "bd_lon"    # D

    .prologue
    .line 65
    const-wide v12, 0x3f7a9fbe76c8b439L    # 0.0065

    sub-double v6, p2, v12

    .local v6, "x":D
    const-wide v12, 0x3f789374bc6a7efaL    # 0.006

    sub-double v8, p0, v12

    .line 66
    .local v8, "y":D
    mul-double v12, v6, v6

    mul-double v14, v8, v8

    add-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    const-wide v14, 0x3ef4f8b588e368f1L    # 2.0E-5

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v8

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sin(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    sub-double v10, v12, v14

    .line 67
    .local v10, "z":D
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v12

    const-wide v14, 0x3ec92a737110e454L    # 3.0E-6

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v6

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    sub-double v4, v12, v14

    .line 68
    .local v4, "theta":D
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double v2, v10, v12

    .line 69
    .local v2, "gg_lon":D
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    mul-double v0, v10, v12

    .line 70
    .local v0, "gg_lat":D
    new-instance v12, Lcom/boyaa/androidim/utils/Gps;

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    return-object v12
.end method

.method public static bd09_To_Gps84(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 6
    .param p0, "bd_lat"    # D
    .param p2, "bd_lon"    # D

    .prologue
    .line 81
    invoke-static {p0, p1, p2, p3}, Lcom/boyaa/androidim/utils/PositionUtil;->bd09_To_Gcj02(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v0

    .line 82
    .local v0, "gcj02":Lcom/boyaa/androidim/utils/Gps;
    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v2

    .line 83
    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v4

    .line 82
    invoke-static {v2, v3, v4, v5}, Lcom/boyaa/androidim/utils/PositionUtil;->gcj_To_Gps84(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v1

    .line 84
    .local v1, "map84":Lcom/boyaa/androidim/utils/Gps;
    return-object v1
.end method

.method public static gcj02_To_Bd09(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 18
    .param p0, "gg_lat"    # D
    .param p2, "gg_lon"    # D

    .prologue
    .line 52
    move-wide/from16 v6, p2

    .local v6, "x":D
    move-wide/from16 v8, p0

    .line 53
    .local v8, "y":D
    mul-double v12, v6, v6

    mul-double v14, v8, v8

    add-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    const-wide v14, 0x3ef4f8b588e368f1L    # 2.0E-5

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v8

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sin(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    add-double v10, v12, v14

    .line 54
    .local v10, "z":D
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v12

    const-wide v14, 0x3ec92a737110e454L    # 3.0E-6

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v6

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    add-double v4, v12, v14

    .line 55
    .local v4, "theta":D
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double/2addr v12, v10

    const-wide v14, 0x3f7a9fbe76c8b439L    # 0.0065

    add-double v2, v12, v14

    .line 56
    .local v2, "bd_lon":D
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    mul-double/2addr v12, v10

    const-wide v14, 0x3f789374bc6a7efaL    # 0.006

    add-double v0, v12, v14

    .line 57
    .local v0, "bd_lat":D
    new-instance v12, Lcom/boyaa/androidim/utils/Gps;

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    return-object v12
.end method

.method public static gcj_To_Gps84(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 11
    .param p0, "lat"    # D
    .param p2, "lon"    # D

    .prologue
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 39
    invoke-static {p0, p1, p2, p3}, Lcom/boyaa/androidim/utils/PositionUtil;->transform(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v0

    .line 40
    .local v0, "gps":Lcom/boyaa/androidim/utils/Gps;
    mul-double v5, p2, v9

    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v7

    sub-double v3, v5, v7

    .line 41
    .local v3, "lontitude":D
    mul-double v5, p0, v9

    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v7

    sub-double v1, v5, v7

    .line 42
    .local v1, "latitude":D
    new-instance v5, Lcom/boyaa/androidim/utils/Gps;

    invoke-direct {v5, v1, v2, v3, v4}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    return-object v5
.end method

.method public static gps84_To_Gcj02(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 22
    .param p0, "lat"    # D
    .param p2, "lon"    # D

    .prologue
    .line 19
    invoke-static/range {p0 .. p3}, Lcom/boyaa/androidim/utils/PositionUtil;->outOfChina(DD)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 20
    const/4 v14, 0x0

    .line 32
    :goto_0
    return-object v14

    .line 22
    :cond_0
    const-wide v14, 0x405a400000000000L    # 105.0

    sub-double v14, p2, v14

    const-wide v16, 0x4041800000000000L    # 35.0

    sub-double v16, p0, v16

    invoke-static/range {v14 .. v17}, Lcom/boyaa/androidim/utils/PositionUtil;->transformLat(DD)D

    move-result-wide v0

    .line 23
    .local v0, "dLat":D
    const-wide v14, 0x405a400000000000L    # 105.0

    sub-double v14, p2, v14

    const-wide v16, 0x4041800000000000L    # 35.0

    sub-double v16, p0, v16

    invoke-static/range {v14 .. v17}, Lcom/boyaa/androidim/utils/PositionUtil;->transformLon(DD)D

    move-result-wide v2

    .line 24
    .local v2, "dLon":D
    const-wide v14, 0x4066800000000000L    # 180.0

    div-double v14, p0, v14

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v10, v14, v16

    .line 25
    .local v10, "radLat":D
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    .line 26
    .local v4, "magic":D
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->ee:D

    mul-double v16, v16, v4

    mul-double v16, v16, v4

    sub-double v4, v14, v16

    .line 27
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    .line 28
    .local v12, "sqrtMagic":D
    const-wide v14, 0x4066800000000000L    # 180.0

    mul-double/2addr v14, v0

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->a:D

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    sget-wide v20, Lcom/boyaa/androidim/utils/PositionUtil;->ee:D

    sub-double v18, v18, v20

    mul-double v16, v16, v18

    mul-double v18, v4, v12

    div-double v16, v16, v18

    sget-wide v18, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v18

    div-double v0, v14, v16

    .line 29
    const-wide v14, 0x4066800000000000L    # 180.0

    mul-double/2addr v14, v2

    sget-wide v16, Lcom/boyaa/androidim/utils/PositionUtil;->a:D

    div-double v16, v16, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    mul-double v16, v16, v18

    sget-wide v18, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v16, v16, v18

    div-double v2, v14, v16

    .line 30
    add-double v6, p0, v0

    .line 31
    .local v6, "mgLat":D
    add-double v8, p2, v2

    .line 32
    .local v8, "mgLon":D
    new-instance v14, Lcom/boyaa/androidim/utils/Gps;

    invoke-direct {v14, v6, v7, v8, v9}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 135
    new-instance v3, Lcom/boyaa/androidim/utils/Gps;

    const-wide v5, 0x403f6d490e66cb10L    # 31.426896

    const-wide v7, 0x405ddfc0d6f544bbL    # 119.496145

    invoke-direct {v3, v5, v6, v7, v8}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    .line 136
    .local v3, "gps":Lcom/boyaa/androidim/utils/Gps;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "gps :"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 137
    invoke-virtual {v3}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v5

    invoke-virtual {v3}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Lcom/boyaa/androidim/utils/PositionUtil;->gps84_To_Gcj02(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v1

    .line 138
    .local v1, "gcj":Lcom/boyaa/androidim/utils/Gps;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "gcj :"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 139
    invoke-virtual {v1}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v5

    invoke-virtual {v1}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Lcom/boyaa/androidim/utils/PositionUtil;->gcj_To_Gps84(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v4

    .line 140
    .local v4, "star":Lcom/boyaa/androidim/utils/Gps;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "star:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 141
    invoke-virtual {v1}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v5

    invoke-virtual {v1}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Lcom/boyaa/androidim/utils/PositionUtil;->gcj02_To_Bd09(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v0

    .line 142
    .local v0, "bd":Lcom/boyaa/androidim/utils/Gps;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "bd  :"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v5

    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Lcom/boyaa/androidim/utils/PositionUtil;->bd09_To_Gcj02(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v2

    .line 144
    .local v2, "gcj2":Lcom/boyaa/androidim/utils/Gps;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "gcj :"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public static outOfChina(DD)Z
    .locals 3
    .param p0, "lat"    # D
    .param p2, "lon"    # D

    .prologue
    const/4 v0, 0x1

    .line 89
    const-wide v1, 0x4052004189374bc7L    # 72.004

    cmpg-double v1, p2, v1

    if-ltz v1, :cond_0

    const-wide v1, 0x40613ab5dcc63f14L    # 137.8347

    cmpl-double v1, p2, v1

    if-lez v1, :cond_1

    .line 93
    :cond_0
    :goto_0
    return v0

    .line 91
    :cond_1
    const-wide v1, 0x3fea89a027525461L    # 0.8293

    cmpg-double v1, p0, v1

    if-ltz v1, :cond_0

    const-wide v1, 0x404be9de69ad42c4L    # 55.8271

    cmpl-double v1, p0, v1

    if-gtz v1, :cond_0

    .line 93
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static transform(DD)Lcom/boyaa/androidim/utils/Gps;
    .locals 27
    .param p0, "lat"    # D
    .param p2, "lon"    # D

    .prologue
    .line 97
    invoke-static/range {p0 .. p3}, Lcom/boyaa/androidim/utils/PositionUtil;->outOfChina(DD)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 98
    new-instance v19, Lcom/boyaa/androidim/utils/Gps;

    move-object/from16 v0, v19

    move-wide/from16 v1, p0

    move-wide/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    .line 110
    :goto_0
    return-object v19

    .line 100
    :cond_0
    const-wide v19, 0x405a400000000000L    # 105.0

    sub-double v19, p2, v19

    const-wide v21, 0x4041800000000000L    # 35.0

    sub-double v21, p0, v21

    invoke-static/range {v19 .. v22}, Lcom/boyaa/androidim/utils/PositionUtil;->transformLat(DD)D

    move-result-wide v5

    .line 101
    .local v5, "dLat":D
    const-wide v19, 0x405a400000000000L    # 105.0

    sub-double v19, p2, v19

    const-wide v21, 0x4041800000000000L    # 35.0

    sub-double v21, p0, v21

    invoke-static/range {v19 .. v22}, Lcom/boyaa/androidim/utils/PositionUtil;->transformLon(DD)D

    move-result-wide v7

    .line 102
    .local v7, "dLon":D
    const-wide v19, 0x4066800000000000L    # 180.0

    div-double v19, p0, v19

    sget-wide v21, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v15, v19, v21

    .line 103
    .local v15, "radLat":D
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    .line 104
    .local v9, "magic":D
    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    sget-wide v21, Lcom/boyaa/androidim/utils/PositionUtil;->ee:D

    mul-double v21, v21, v9

    mul-double v21, v21, v9

    sub-double v9, v19, v21

    .line 105
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v17

    .line 106
    .local v17, "sqrtMagic":D
    const-wide v19, 0x4066800000000000L    # 180.0

    mul-double v19, v19, v5

    sget-wide v21, Lcom/boyaa/androidim/utils/PositionUtil;->a:D

    const-wide/high16 v23, 0x3ff0000000000000L    # 1.0

    sget-wide v25, Lcom/boyaa/androidim/utils/PositionUtil;->ee:D

    sub-double v23, v23, v25

    mul-double v21, v21, v23

    mul-double v23, v9, v17

    div-double v21, v21, v23

    sget-wide v23, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v21, v21, v23

    div-double v5, v19, v21

    .line 107
    const-wide v19, 0x4066800000000000L    # 180.0

    mul-double v19, v19, v7

    sget-wide v21, Lcom/boyaa/androidim/utils/PositionUtil;->a:D

    div-double v21, v21, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v23

    mul-double v21, v21, v23

    sget-wide v23, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double v21, v21, v23

    div-double v7, v19, v21

    .line 108
    add-double v11, p0, v5

    .line 109
    .local v11, "mgLat":D
    add-double v13, p2, v7

    .line 110
    .local v13, "mgLon":D
    new-instance v19, Lcom/boyaa/androidim/utils/Gps;

    move-object/from16 v0, v19

    invoke-direct {v0, v11, v12, v13, v14}, Lcom/boyaa/androidim/utils/Gps;-><init>(DD)V

    goto :goto_0
.end method

.method public static transformLat(DD)D
    .locals 10
    .param p0, "x"    # D
    .param p2, "y"    # D

    .prologue
    .line 114
    const-wide/high16 v2, -0x3fa7000000000000L    # -100.0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v4, p0

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    mul-double/2addr v4, p2

    add-double/2addr v2, v4

    const-wide v4, 0x3fc999999999999aL    # 0.2

    mul-double/2addr v4, p2

    mul-double/2addr v4, p2

    add-double/2addr v2, v4

    const-wide v4, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v4, p0

    mul-double/2addr v4, p2

    add-double/2addr v2, v4

    .line 115
    const-wide v4, 0x3fc999999999999aL    # 0.2

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    .line 114
    add-double v0, v2, v4

    .line 116
    .local v0, "ret":D
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    const-wide/high16 v4, 0x4018000000000000L    # 6.0

    mul-double/2addr v4, p0

    sget-wide v6, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4034000000000000L    # 20.0

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    mul-double/2addr v6, p0

    sget-wide v8, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 117
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    sget-wide v4, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, p2

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4044000000000000L    # 40.0

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    div-double v6, p2, v6

    sget-wide v8, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 118
    const-wide/high16 v2, 0x4064000000000000L    # 160.0

    const-wide/high16 v4, 0x4028000000000000L    # 12.0

    div-double v4, p2, v4

    sget-wide v6, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4074000000000000L    # 320.0

    sget-wide v6, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, p2

    const-wide/high16 v8, 0x403e000000000000L    # 30.0

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 119
    return-wide v0
.end method

.method public static transformLon(DD)D
    .locals 10
    .param p0, "x"    # D
    .param p2, "y"    # D

    .prologue
    .line 123
    const-wide v2, 0x4072c00000000000L    # 300.0

    add-double/2addr v2, p0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v4, p2

    add-double/2addr v2, v4

    const-wide v4, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v4, p0

    mul-double/2addr v4, p0

    add-double/2addr v2, v4

    const-wide v4, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v4, p0

    mul-double/2addr v4, p2

    add-double/2addr v2, v4

    const-wide v4, 0x3fb999999999999aL    # 0.1

    .line 124
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    .line 123
    add-double v0, v2, v4

    .line 125
    .local v0, "ret":D
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    const-wide/high16 v4, 0x4018000000000000L    # 6.0

    mul-double/2addr v4, p0

    sget-wide v6, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4034000000000000L    # 20.0

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    mul-double/2addr v6, p0

    sget-wide v8, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 126
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    sget-wide v4, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, p0

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4044000000000000L    # 40.0

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    div-double v6, p0, v6

    sget-wide v8, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 127
    const-wide v2, 0x4062c00000000000L    # 150.0

    const-wide/high16 v4, 0x4028000000000000L    # 12.0

    div-double v4, p0, v4

    sget-wide v6, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    const-wide v4, 0x4072c00000000000L    # 300.0

    const-wide/high16 v6, 0x403e000000000000L    # 30.0

    div-double v6, p0, v6

    .line 128
    sget-wide v8, Lcom/boyaa/androidim/utils/PositionUtil;->pi:D

    mul-double/2addr v6, v8

    .line 127
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    .line 128
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 127
    mul-double/2addr v2, v4

    .line 128
    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    add-double/2addr v0, v2

    .line 129
    return-wide v0
.end method
