.class final Lcom/baidu/location/c/a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/baidu/location/b/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/baidu/location/c/a$b;,
        Lcom/baidu/location/c/a$a;,
        Lcom/baidu/location/c/a$c;
    }
.end annotation


# static fields
.field private static final c:I = 0x2710

.field private static final char:I = 0x3e8

.field private static final d:I = 0x7d0

.field private static final e:I = 0x4

.field private static final else:I = 0x1e

.field private static final f:I = 0x2

.field private static final for:D = 100.0

.field private static final g:I = 0x1

.field private static final h:I = 0x0

.field static final i:I = 0x1e

.field private static final if:I = 0x76a700

.field private static final j:I = 0x186a0

.field private static final l:I = 0x93a80

.field private static final n:I = 0x12c

.field private static final p:I = 0x64

.field static final s:I = 0x8

.field private static final try:I = 0xed4e00

.field private static final u:I = 0x3e8

.field private static final v:I = 0x93a80

.field private static final w:D = 300.0


# instance fields
.field private b:Ljava/lang/StringBuffer;

.field private final byte:Landroid/database/sqlite/SQLiteDatabase;

.field private case:I

.field private do:Ljava/util/concurrent/ConcurrentHashMap;

.field private goto:Ljava/lang/StringBuffer;

.field private int:D

.field private k:Ljava/lang/Long;

.field private long:Ljava/util/concurrent/ConcurrentHashMap;

.field private m:Z

.field private new:D

.field private final o:Lcom/baidu/location/c/d;

.field private final q:Landroid/database/sqlite/SQLiteDatabase;

.field private r:Ljava/lang/StringBuffer;

.field private t:Ljava/util/HashSet;

.field private final void:Lcom/baidu/location/c/a$b;

.field private final x:Lcom/baidu/location/c/a$b;


# direct methods
.method constructor <init>(Lcom/baidu/location/c/d;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    iput-boolean v3, p0, Lcom/baidu/location/c/a;->m:Z

    new-instance v0, Lcom/baidu/location/c/a$b;

    const/4 v2, 0x1

    invoke-direct {v0, p0, p0, v2}, Lcom/baidu/location/c/a$b;-><init>(Lcom/baidu/location/c/a;Lcom/baidu/location/c/a;Z)V

    iput-object v0, p0, Lcom/baidu/location/c/a;->void:Lcom/baidu/location/c/a$b;

    new-instance v0, Lcom/baidu/location/c/a$b;

    invoke-direct {v0, p0, p0, v3}, Lcom/baidu/location/c/a$b;-><init>(Lcom/baidu/location/c/a;Lcom/baidu/location/c/a;Z)V

    iput-object v0, p0, Lcom/baidu/location/c/a;->x:Lcom/baidu/location/c/a$b;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    iput-object v1, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    iput-object v1, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->t:Ljava/util/HashSet;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->long:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v2}, Lcom/baidu/location/c/d;->d()Ljava/io/File;

    move-result-object v2

    const-string v3, "ofl_location.db"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    :cond_0
    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "CREATE TABLE IF NOT EXISTS AP (id LONG PRIMARY KEY,x DOUBLE,y DOUBLE,r INTEGER,cl DOUBLE,timestamp INTEGER, frequency INTEGER DEFAULT 0);"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "CREATE TABLE IF NOT EXISTS CL (id LONG PRIMARY KEY,x DOUBLE,y DOUBLE,r INTEGER,cl DOUBLE,timestamp INTEGER, frequency INTEGER DEFAULT 0);"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    :cond_1
    :goto_1
    :try_start_2
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v2}, Lcom/baidu/location/c/d;->d()Ljava/io/File;

    move-result-object v2

    const-string v3, "ofl_statistics.db"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    :cond_2
    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v1

    :goto_2
    iput-object v1, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_3

    :try_start_3
    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS AP (id LONG PRIMARY KEY, originid VARCHAR(15), frequency INTEGER DEFAULT 0);"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS CL (id LONG PRIMARY KEY, originid VARCHAR(40), frequency INTEGER DEFAULT 0);"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :cond_3
    :goto_3
    return-void

    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method static synthetic do(Lcom/baidu/location/c/a;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method static synthetic do(Lcom/baidu/location/c/a;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 0

    iput-object p1, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    return-object p1
.end method

.method static synthetic for(Lcom/baidu/location/c/a;)Lcom/baidu/location/c/d;
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    return-object v0
.end method

.method private if(DDDD)D
    .locals 14

    sub-double v0, p7, p3

    sub-double v2, p5, p1

    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    invoke-static/range {p3 .. p4}, Ljava/lang/Math;->toRadians(D)D

    invoke-static/range {p5 .. p6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    invoke-static/range {p7 .. p8}, Ljava/lang/Math;->toRadians(D)D

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    const-wide v8, 0x415854a640000000L    # 6378137.0

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    div-double v10, v2, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v12

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double/2addr v2, v10

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double v6, v0, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double/2addr v0, v4

    add-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    sub-double v0, v6, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    mul-double/2addr v0, v2

    mul-double/2addr v0, v8

    return-wide v0
.end method

.method private if(Ljava/util/ArrayList;D)I
    .locals 18

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    :cond_0
    return v1

    :cond_1
    const/4 v1, 0x0

    move v10, v1

    :goto_0
    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_4

    const-wide/16 v4, 0x0

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    move-wide v6, v2

    move v2, v1

    move-wide/from16 v16, v4

    move-wide/from16 v3, v16

    :goto_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v2, v1, :cond_2

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/baidu/location/c/a$c;

    iget-wide v8, v1, Lcom/baidu/location/c/a$c;->a:D

    add-double/2addr v8, v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/baidu/location/c/a$c;

    iget-wide v3, v1, Lcom/baidu/location/c/a$c;->do:D

    add-double/2addr v3, v6

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-wide v6, v3

    move-wide v3, v8

    goto :goto_1

    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    int-to-double v1, v1

    div-double v4, v3, v1

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    int-to-double v1, v1

    div-double v2, v6, v1

    const-wide/high16 v7, -0x4010000000000000L    # -1.0

    const/4 v6, -0x1

    const/4 v1, 0x0

    move v11, v1

    move v12, v6

    move-wide v13, v7

    :goto_2
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v11, v1, :cond_3

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/baidu/location/c/a$c;

    iget-wide v6, v1, Lcom/baidu/location/c/a$c;->do:D

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/baidu/location/c/a$c;

    iget-wide v8, v1, Lcom/baidu/location/c/a$c;->a:D

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/baidu/location/c/a;->if(DDDD)D

    move-result-wide v7

    cmpl-double v1, v7, v13

    if-lez v1, :cond_5

    move v6, v11

    :goto_3
    add-int/lit8 v1, v11, 0x1

    move v11, v1

    move v12, v6

    move-wide v13, v7

    goto :goto_2

    :cond_3
    cmpl-double v1, v13, p2

    if-lez v1, :cond_4

    if-ltz v12, :cond_4

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v12, v1, :cond_4

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    const/4 v1, 0x1

    move v2, v1

    move v1, v10

    :goto_4
    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    move v10, v1

    goto/16 :goto_0

    :cond_4
    move v2, v15

    move v1, v10

    goto :goto_4

    :cond_5
    move v6, v12

    move-wide v7, v13

    goto :goto_3
.end method

.method private if(Ljava/lang/Long;)Lcom/baidu/location/BDLocation;
    .locals 18

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/baidu/location/c/a;->m:Z

    const/4 v8, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->k:Ljava/lang/Long;

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->k:Ljava/lang/Long;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/baidu/location/c/a;->new:D

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/baidu/location/c/a;->int:D

    move-object/from16 v0, p0

    iget v8, v0, Lcom/baidu/location/c/a;->case:I

    :cond_0
    :goto_0
    if-eqz v3, :cond_7

    new-instance v2, Lcom/baidu/location/BDLocation;

    invoke-direct {v2}, Lcom/baidu/location/BDLocation;-><init>()V

    int-to-float v3, v8

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setRadius(F)V

    invoke-virtual {v2, v4, v5}, Lcom/baidu/location/BDLocation;->setLatitude(D)V

    invoke-virtual {v2, v6, v7}, Lcom/baidu/location/BDLocation;->setLongitude(D)V

    const-string v3, "cl"

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setNetworkLocationType(Ljava/lang/String;)V

    const/16 v3, 0x42

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setLocType(I)V

    :goto_1
    return-object v2

    :cond_1
    const/4 v2, 0x0

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "SELECT * FROM CL WHERE id = %d AND timestamp + %d > %d;"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    const/4 v12, 0x1

    const v13, 0xed4e00

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long/2addr v13, v15

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    :try_start_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v11, 0x0

    invoke-virtual {v10, v9, v11}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-eqz v2, :cond_4

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_4

    const-string v9, "cl"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmpl-double v9, v9, v11

    if-lez v9, :cond_4

    const/4 v3, 0x1

    const-string v9, "x"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v6

    const-string v9, "y"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    const-string v9, "r"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    const-string v9, "timestamp"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    const v10, 0x93a80

    add-int/2addr v9, v10

    int-to-long v9, v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const-wide/16 v13, 0x3e8

    div-long/2addr v11, v13

    cmp-long v9, v9, v11

    if-gez v9, :cond_2

    const/4 v9, 0x1

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/baidu/location/c/a;->m:Z

    :cond_2
    const/16 v9, 0x12c

    if-ge v8, v9, :cond_5

    const/16 v8, 0x12c

    :cond_3
    :goto_2
    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/baidu/location/c/a;->new:D

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/baidu/location/c/a;->int:D

    move-object/from16 v0, p0

    iput v8, v0, Lcom/baidu/location/c/a;->case:I

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/baidu/location/c/a;->k:Ljava/lang/Long;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_4
    if-eqz v2, :cond_0

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v2

    goto/16 :goto_0

    :cond_5
    const/16 v9, 0x7d0

    if-ge v9, v8, :cond_3

    const/16 v8, 0x7d0

    goto :goto_2

    :catch_1
    move-exception v9

    if-eqz v2, :cond_0

    :try_start_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v2

    goto/16 :goto_0

    :catchall_0
    move-exception v3

    move-object/from16 v17, v3

    move-object v3, v2

    move-object/from16 v2, v17

    :goto_3
    if-eqz v3, :cond_6

    :try_start_4
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :cond_6
    :goto_4
    throw v2

    :cond_7
    const/4 v2, 0x0

    goto/16 :goto_1

    :catch_3
    move-exception v3

    goto :goto_4

    :catchall_1
    move-exception v3

    move-object/from16 v17, v3

    move-object v3, v2

    move-object/from16 v2, v17

    goto :goto_3
.end method

.method private if(Ljava/util/LinkedHashMap;Lcom/baidu/location/BDLocation;I)Lcom/baidu/location/BDLocation;
    .locals 34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    const-wide/16 v5, 0x0

    const-wide/16 v3, 0x0

    const/4 v2, 0x0

    if-eqz p2, :cond_19

    const/4 v2, 0x1

    invoke-virtual/range {p2 .. p2}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v3

    invoke-virtual/range {p2 .. p2}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v5

    move/from16 v19, v2

    :goto_0
    const/16 v26, 0x0

    const-wide/16 v24, 0x0

    const-wide/16 v22, 0x0

    const/16 v21, 0x0

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v7, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/4 v2, 0x0

    move v8, v2

    move v9, v7

    :goto_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/16 v7, 0x1e

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v8, v2, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-gez v12, :cond_0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    neg-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_0
    invoke-static {v7}, Lcom/baidu/location/Jni;->I(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    if-nez v12, :cond_1

    move v7, v9

    :goto_2
    add-int/lit8 v2, v8, 0x1

    move v8, v2

    move v9, v7

    goto :goto_1

    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v13, v12, v7}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v9, :cond_2

    const/4 v9, 0x0

    :goto_3
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/baidu/location/c/a;->long:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, v12, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move v7, v9

    goto :goto_2

    :cond_2
    const/16 v7, 0x2c

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_3

    :cond_3
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SELECT * FROM AP WHERE id IN (%s) AND timestamp+%d>%d;"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const v10, 0x76a700

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v2, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v9, 0x0

    invoke-virtual {v8, v7, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v20

    if-eqz v20, :cond_18

    :try_start_1
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_18

    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    :goto_4
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_d

    const/4 v2, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    const/4 v2, 0x1

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v9

    const/4 v2, 0x2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v7

    const/4 v2, 0x3

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    const/4 v2, 0x4

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v14

    const/4 v2, 0x5

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/baidu/location/c/a;->t:Ljava/util/HashSet;

    invoke-virtual {v12, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const v12, 0x93a80

    add-int/2addr v2, v12

    int-to-long v0, v2

    move-wide/from16 v16, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    const-wide/16 v30, 0x3e8

    div-long v28, v28, v30

    cmp-long v2, v16, v28

    if-gez v2, :cond_5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    const-string v12, ","

    invoke-virtual {v2, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "(%d,\"%s\",%d)"

    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v11, v17, v18

    const/16 v18, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    aput-object v28, v17, v18

    const/16 v18, 0x2

    const v28, 0x186a0

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v17, v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v12, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_5
    const-wide/16 v16, 0x0

    cmpg-double v2, v14, v16

    if-gtz v2, :cond_7

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_4

    :catch_0
    move-exception v2

    move-object/from16 v2, v20

    move/from16 v3, v21

    move-wide/from16 v10, v22

    move-wide/from16 v8, v24

    move/from16 v4, v26

    :goto_5
    if-eqz v2, :cond_6

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_6
    :goto_6
    if-eqz v3, :cond_13

    new-instance v2, Lcom/baidu/location/BDLocation;

    invoke-direct {v2}, Lcom/baidu/location/BDLocation;-><init>()V

    int-to-float v3, v4

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setRadius(F)V

    invoke-virtual {v2, v10, v11}, Lcom/baidu/location/BDLocation;->setLatitude(D)V

    invoke-virtual {v2, v8, v9}, Lcom/baidu/location/BDLocation;->setLongitude(D)V

    const-string v3, "wf"

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setNetworkLocationType(Ljava/lang/String;)V

    const/16 v3, 0x42

    invoke-virtual {v2, v3}, Lcom/baidu/location/BDLocation;->setLocType(I)V

    :goto_7
    return-object v2

    :cond_7
    const-wide/16 v14, 0x0

    cmpg-double v2, v9, v14

    if-lez v2, :cond_8

    const-wide/16 v14, 0x0

    cmpg-double v2, v7, v14

    if-lez v2, :cond_8

    if-lez v13, :cond_8

    const/16 v2, 0x3e8

    if-lt v13, v2, :cond_a

    :cond_8
    :try_start_3
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_4

    :catchall_0
    move-exception v2

    :goto_8
    if-eqz v20, :cond_9

    :try_start_4
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :cond_9
    :goto_9
    throw v2

    :cond_a
    const/4 v2, 0x1

    move/from16 v0, v19

    if-ne v0, v2, :cond_b

    move-object/from16 v2, p0

    :try_start_5
    invoke-direct/range {v2 .. v10}, Lcom/baidu/location/c/a;->if(DDDD)D

    move-result-wide v14

    const-wide v16, 0x40c3880000000000L    # 10000.0

    cmpl-double v2, v14, v16

    if-lez v2, :cond_b

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_4

    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/a;->long:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v11}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v11, 0x1e

    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/16 v11, 0x64

    invoke-static {v11, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    const/16 v14, 0x46

    if-le v2, v14, :cond_c

    add-int/lit8 v2, v2, -0x46

    int-to-double v14, v2

    const-wide/high16 v16, 0x403e000000000000L    # 30.0

    div-double v14, v14, v16

    add-double/2addr v11, v14

    :goto_a
    const-wide/high16 v14, 0x4049000000000000L    # 50.0

    int-to-double v0, v13

    move-wide/from16 v16, v0

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->max(DD)D

    move-result-wide v13

    const-wide v15, 0x3fe3333333333333L    # 0.6

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    const-wide v15, -0x404f5c28f5c28f5cL    # -0.065

    mul-double/2addr v13, v15

    mul-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->exp(D)D

    move-result-wide v16

    new-instance v11, Lcom/baidu/location/c/a$c;

    const/16 v18, 0x0

    move-wide v12, v9

    move-wide v14, v7

    invoke-direct/range {v11 .. v18}, Lcom/baidu/location/c/a$c;-><init>(DDDLcom/baidu/location/c/a$1;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_4

    :cond_c
    add-int/lit8 v2, v2, -0x46

    int-to-double v14, v2

    const-wide/high16 v16, 0x4049000000000000L    # 50.0

    div-double v14, v14, v16

    add-double/2addr v11, v14

    goto :goto_a

    :cond_d
    const-wide v7, 0x408f400000000000L    # 1000.0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v8}, Lcom/baidu/location/c/a;->if(Ljava/util/ArrayList;D)I

    const-wide/16 v7, 0x0

    const-wide/16 v12, 0x0

    const-wide/16 v10, 0x0

    const/4 v2, 0x0

    move/from16 v16, v2

    :goto_b
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v16

    if-ge v0, v2, :cond_f

    move-object/from16 v0, v27

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/baidu/location/c/a$c;

    iget-wide v14, v2, Lcom/baidu/location/c/a$c;->if:D

    const-wide/16 v17, 0x0

    cmpg-double v9, v14, v17

    if-gtz v9, :cond_e

    move-wide/from16 v32, v10

    move-wide v9, v12

    move-wide v11, v7

    move-wide/from16 v7, v32

    :goto_c
    add-int/lit8 v2, v16, 0x1

    move/from16 v16, v2

    move-wide/from16 v32, v7

    move-wide v7, v11

    move-wide v12, v9

    move-wide/from16 v10, v32

    goto :goto_b

    :cond_e
    iget-wide v14, v2, Lcom/baidu/location/c/a$c;->a:D

    iget-wide v0, v2, Lcom/baidu/location/c/a$c;->if:D

    move-wide/from16 v17, v0

    mul-double v14, v14, v17

    add-double/2addr v14, v7

    iget-wide v7, v2, Lcom/baidu/location/c/a$c;->do:D

    iget-wide v0, v2, Lcom/baidu/location/c/a$c;->if:D

    move-wide/from16 v17, v0

    mul-double v7, v7, v17

    add-double/2addr v12, v7

    iget-wide v7, v2, Lcom/baidu/location/c/a$c;->if:D
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    add-double/2addr v7, v10

    move-wide v9, v12

    move-wide v11, v14

    goto :goto_c

    :cond_f
    const-wide/16 v14, 0x0

    cmpl-double v2, v10, v14

    if-lez v2, :cond_17

    const-wide/16 v14, 0x0

    cmpl-double v2, v7, v14

    if-lez v2, :cond_17

    const-wide/16 v14, 0x0

    cmpl-double v2, v12, v14

    if-lez v2, :cond_17

    div-double v8, v7, v10

    div-double v10, v12, v10

    const/16 v16, 0x1

    const/4 v7, 0x0

    const/4 v2, 0x0

    move/from16 v17, v2

    move v2, v7

    :goto_d
    :try_start_6
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v7

    move/from16 v0, v17

    if-ge v0, v7, :cond_10

    float-to-double v0, v2

    move-wide/from16 v21, v0

    move-object/from16 v0, v27

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/baidu/location/c/a$c;

    iget-wide v12, v2, Lcom/baidu/location/c/a$c;->a:D

    move-object/from16 v0, v27

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/baidu/location/c/a$c;

    iget-wide v14, v2, Lcom/baidu/location/c/a$c;->do:D

    move-object/from16 v7, p0

    invoke-direct/range {v7 .. v15}, Lcom/baidu/location/c/a;->if(DDDD)D

    move-result-wide v12

    add-double v12, v12, v21

    double-to-float v7, v12

    add-int/lit8 v2, v17, 0x1

    move/from16 v17, v2

    move v2, v7

    goto :goto_d

    :cond_10
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v2, v7

    invoke-static {v2}, Ljava/lang/Math;->round(F)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v26

    const/16 v2, 0x1e

    move/from16 v0, v26

    if-ge v0, v2, :cond_12

    const/16 v26, 0x1e

    move/from16 v2, v16

    move/from16 v12, v26

    move-wide/from16 v32, v8

    move-wide v7, v10

    move-wide/from16 v9, v32

    :goto_e
    if-nez v19, :cond_11

    :try_start_7
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v11

    const/4 v13, 0x1

    if-gt v11, v13, :cond_11

    const/4 v2, 0x0

    :cond_11
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v11

    move/from16 v0, p3

    if-ge v11, v0, :cond_15

    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v11

    int-to-double v15, v11

    mul-double/2addr v13, v15

    invoke-virtual/range {p1 .. p1}, Ljava/util/LinkedHashMap;->size()I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v11

    int-to-double v15, v11

    div-double/2addr v13, v15

    const-wide/high16 v15, 0x3fe0000000000000L    # 0.5

    cmpg-double v11, v13, v15

    if-gez v11, :cond_15

    const/4 v2, 0x0

    move v11, v2

    :goto_f
    const/4 v2, 0x1

    move/from16 v0, v19

    if-ne v0, v2, :cond_14

    const/4 v2, 0x1

    if-ne v11, v2, :cond_14

    move-object/from16 v2, p0

    :try_start_8
    invoke-direct/range {v2 .. v10}, Lcom/baidu/location/c/a;->if(DDDD)D
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-result-wide v2

    const-wide v4, 0x40c3880000000000L    # 10000.0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_14

    const/4 v11, 0x0

    move v3, v11

    move v4, v12

    move-wide/from16 v32, v9

    move-wide v10, v7

    move-wide/from16 v8, v32

    :goto_10
    if-eqz v20, :cond_6

    :try_start_9
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    goto/16 :goto_6

    :catch_1
    move-exception v2

    goto/16 :goto_6

    :cond_12
    const/16 v2, 0x64

    move/from16 v0, v26

    if-ge v2, v0, :cond_16

    const/16 v26, 0x64

    move/from16 v2, v16

    move/from16 v12, v26

    move-wide/from16 v32, v8

    move-wide v7, v10

    move-wide/from16 v9, v32

    goto :goto_e

    :cond_13
    const/4 v2, 0x0

    goto/16 :goto_7

    :catch_2
    move-exception v2

    goto/16 :goto_6

    :catch_3
    move-exception v3

    goto/16 :goto_9

    :catchall_1
    move-exception v3

    move-object/from16 v20, v2

    move-object v2, v3

    goto/16 :goto_8

    :catch_4
    move-exception v3

    move/from16 v3, v21

    move-wide/from16 v10, v22

    move-wide/from16 v8, v24

    move/from16 v4, v26

    goto/16 :goto_5

    :catch_5
    move-exception v2

    move-object/from16 v2, v20

    move/from16 v3, v16

    move/from16 v4, v26

    goto/16 :goto_5

    :catch_6
    move-exception v3

    move v3, v2

    move v4, v12

    move-object/from16 v2, v20

    move-wide/from16 v32, v9

    move-wide v10, v7

    move-wide/from16 v8, v32

    goto/16 :goto_5

    :catch_7
    move-exception v2

    move-object/from16 v2, v20

    move v3, v11

    move v4, v12

    move-wide/from16 v32, v9

    move-wide v10, v7

    move-wide/from16 v8, v32

    goto/16 :goto_5

    :cond_14
    move v3, v11

    move v4, v12

    move-wide/from16 v32, v9

    move-wide v10, v7

    move-wide/from16 v8, v32

    goto :goto_10

    :cond_15
    move v11, v2

    goto :goto_f

    :cond_16
    move/from16 v2, v16

    move/from16 v12, v26

    move-wide/from16 v32, v8

    move-wide v7, v10

    move-wide/from16 v9, v32

    goto/16 :goto_e

    :cond_17
    move/from16 v2, v21

    move-wide/from16 v7, v22

    move-wide/from16 v9, v24

    move/from16 v12, v26

    goto/16 :goto_e

    :cond_18
    move/from16 v3, v21

    move-wide/from16 v10, v22

    move-wide/from16 v8, v24

    move/from16 v4, v26

    goto :goto_10

    :cond_19
    move/from16 v19, v2

    goto/16 :goto_0
.end method

.method static synthetic if(Lcom/baidu/location/c/a;)Lcom/baidu/location/c/a$b;
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->x:Lcom/baidu/location/c/a$b;

    return-object v0
.end method

.method static synthetic if(Lcom/baidu/location/c/a;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 0

    iput-object p1, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    return-object p1
.end method

.method private if(Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 9

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v0

    const/16 v1, 0xa1

    if-ne v0, v1, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getNetworkLocationType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "cl"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v1

    invoke-virtual {p2}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v5

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v7

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/baidu/location/c/a;->if(DDDD)D

    move-result-wide v0

    const-wide v2, 0x4072c00000000000L    # 300.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "UPDATE CL SET cl = 0 WHERE id = %d;"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p5, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "INSERT OR REPLACE INTO CL VALUES (%d,\"%s\",%d);"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p5, v3, v4

    const/4 v4, 0x1

    aput-object p4, v3, v4

    const/4 v4, 0x2

    const v5, 0x186a0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    iget-object v2, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_0
    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getNetworkLocationType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "wf"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v1

    invoke-virtual {p3}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v5

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v7

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/baidu/location/c/a;->if(DDDD)D

    move-result-wide v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1

    const-string v0, "UPDATE AP SET cl = 0 WHERE id In (%s);"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "INSERT OR REPLACE INTO AP VALUES %s;"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :try_start_1
    iget-object v2, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method static synthetic if(Lcom/baidu/location/c/a;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/baidu/location/c/a;->if(Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/c/a;Ljava/lang/String;Ljava/lang/Long;Lcom/baidu/location/BDLocation;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/baidu/location/c/a;->if(Ljava/lang/String;Ljava/lang/Long;Lcom/baidu/location/BDLocation;)V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/c/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/baidu/location/c/a;->if(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/c/a;Ljava/util/LinkedHashMap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/c/a;->if(Ljava/util/LinkedHashMap;)V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/c/a;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/c/a;->if([Ljava/lang/String;)V

    return-void
.end method

.method private if(Ljava/lang/String;Ljava/lang/Long;Lcom/baidu/location/BDLocation;)V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    if-eqz p3, :cond_1

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "UPDATE CL SET frequency=frequency+1 WHERE id = %d;"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p2, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    iget-object v1, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    iget-boolean v0, p0, Lcom/baidu/location/c/a;->m:Z

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "INSERT OR IGNORE INTO CL VALUES (%d,\"%s\",%d);"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v4

    aput-object p1, v2, v5

    const v3, 0x186a0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :try_start_1
    iget-object v1, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    :goto_1
    return-void

    :cond_1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "INSERT OR IGNORE INTO CL VALUES (%d,\"%s\",0);"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p2, v2, v4

    aput-object p1, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "UPDATE CL SET frequency=frequency+1 WHERE id = %d;"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :try_start_2
    iget-object v2, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method private if(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->void:Lcom/baidu/location/c/a$b;

    invoke-static {v0, p1, p2, p3}, Lcom/baidu/location/c/a$b;->if(Lcom/baidu/location/c/a$b;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private if(Ljava/util/LinkedHashMap;)V
    .locals 11

    const/4 v3, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    if-lez v0, :cond_7

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v0, p0, Lcom/baidu/location/c/a;->long:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v2, v3

    move v4, v3

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    :try_start_0
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    iget-object v1, p0, Lcom/baidu/location/c/a;->t:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v4, :cond_0

    move v4, v5

    :goto_1
    iget-object v1, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v9, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    const/16 v10, 0x28

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v9, 0x2c

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v9, 0x22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const v1, 0x186a0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v0, v2

    move v1, v4

    :goto_2
    move v2, v0

    move v4, v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    const/16 v9, 0x2c

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/baidu/location/c/a;->goto:Ljava/lang/StringBuffer;

    const/16 v9, 0x2c

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    :catch_0
    move-exception v0

    move v0, v2

    move v1, v4

    move v2, v0

    move v4, v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v2, :cond_2

    move v2, v5

    :goto_3
    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const/16 v9, 0x28

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v9, 0x2c

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v9, 0x22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ",0)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move v0, v2

    move v1, v4

    goto :goto_2

    :cond_2
    const/16 v9, 0x2c

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const/16 v9, 0x2c

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :cond_3
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "UPDATE AP SET frequency=frequency+1 WHERE id IN(%s)"

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/baidu/location/c/a;->r:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :try_start_1
    iget-object v1, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    :goto_4
    iget-object v0, p0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_5

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_4

    const-string v0, ","

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_4
    iget-object v0, p0, Lcom/baidu/location/c/a;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    :cond_5
    const-string v0, "INSERT OR IGNORE INTO AP VALUES %s;"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "UPDATE AP SET frequency=frequency+1 WHERE id in (%s);"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :try_start_2
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_6

    iget-object v2, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_6
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_7

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_7
    :goto_5
    return-void

    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    goto :goto_4
.end method

.method private if([Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v0}, Lcom/baidu/location/c/d;->new()Lcom/baidu/location/c/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/baidu/location/c/e;->int([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic int(Lcom/baidu/location/c/a;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method


# virtual methods
.method do()V
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method for()V
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->x:Lcom/baidu/location/c/a$b;

    invoke-virtual {v0}, Lcom/baidu/location/c/a$b;->aH()V

    return-void
.end method

.method if(Lcom/baidu/location/c/c$a;)Landroid/database/Cursor;
    .locals 21

    new-instance v15, Lcom/baidu/location/BDLocation;

    invoke-direct {v15}, Lcom/baidu/location/BDLocation;-><init>()V

    const/16 v2, 0x43

    invoke-virtual {v15, v2}, Lcom/baidu/location/BDLocation;->setLocType(I)V

    const/4 v2, 0x0

    move-object/from16 v0, p1

    iget-boolean v3, v0, Lcom/baidu/location/c/c$a;->new:Z

    if-eqz v3, :cond_18

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/baidu/location/c/c$a;->for:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/baidu/location/c/c$a;->if:Ljava/util/LinkedHashMap;

    move-object/from16 v0, p1

    iget v3, v0, Lcom/baidu/location/c/c$a;->do:I

    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/baidu/location/c/c$a;->try:Lcom/baidu/location/BDLocation;

    const/4 v6, 0x0

    const-wide/high16 v11, -0x8000000000000000L

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v7, :cond_0

    invoke-static {v4}, Lcom/baidu/location/Jni;->I(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    if-eqz v5, :cond_0

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/baidu/location/c/a;->if(Ljava/lang/Long;)Lcom/baidu/location/BDLocation;

    move-result-object v6

    :cond_0
    const/4 v7, 0x0

    if-eqz v10, :cond_1

    invoke-virtual {v10}, Ljava/util/LinkedHashMap;->size()I

    move-result v9

    if-lez v9, :cond_1

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/baidu/location/c/a;->q:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v9, :cond_1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/baidu/location/c/a;->long:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/baidu/location/c/a;->t:Ljava/util/HashSet;

    invoke-virtual {v7}, Ljava/util/HashSet;->clear()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/baidu/location/c/a;->do:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v6, v3}, Lcom/baidu/location/c/a;->if(Ljava/util/LinkedHashMap;Lcom/baidu/location/BDLocation;I)Lcom/baidu/location/BDLocation;

    move-result-object v7

    :cond_1
    const/4 v13, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    const/4 v3, 0x0

    const/4 v14, 0x0

    const/4 v11, 0x0

    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    invoke-virtual {v6}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v6}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v16

    invoke-virtual {v6}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v18

    const-string v20, "bd09ll2gcj"

    invoke-static/range {v16 .. v20}, Lcom/baidu/location/Jni;->if(DDLjava/lang/String;)[D

    move-result-object v16

    const-string v17, "gcj"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Lcom/baidu/location/BDLocation;->setCoorType(Ljava/lang/String;)V

    const/16 v17, 0x1

    aget-wide v17, v16, v17

    move-wide/from16 v0, v17

    invoke-virtual {v6, v0, v1}, Lcom/baidu/location/BDLocation;->setLatitude(D)V

    const/16 v17, 0x0

    aget-wide v16, v16, v17

    move-wide/from16 v0, v16

    invoke-virtual {v6, v0, v1}, Lcom/baidu/location/BDLocation;->setLongitude(D)V

    const-string v16, "cl"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Lcom/baidu/location/BDLocation;->setNetworkLocationType(Ljava/lang/String;)V

    :cond_2
    if-eqz v7, :cond_3

    invoke-virtual {v7}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    invoke-virtual {v7}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v7}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v16

    invoke-virtual {v7}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v18

    const-string v20, "bd09ll2gcj"

    invoke-static/range {v16 .. v20}, Lcom/baidu/location/Jni;->if(DDLjava/lang/String;)[D

    move-result-object v16

    const-string v17, "gcj"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lcom/baidu/location/BDLocation;->setCoorType(Ljava/lang/String;)V

    const/16 v17, 0x1

    aget-wide v17, v16, v17

    move-wide/from16 v0, v17

    invoke-virtual {v7, v0, v1}, Lcom/baidu/location/BDLocation;->setLatitude(D)V

    const/16 v17, 0x0

    aget-wide v16, v16, v17

    move-wide/from16 v0, v16

    invoke-virtual {v7, v0, v1}, Lcom/baidu/location/BDLocation;->setLongitude(D)V

    const-string v16, "wf"

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lcom/baidu/location/BDLocation;->setNetworkLocationType(Ljava/lang/String;)V

    :cond_3
    if-eqz v6, :cond_e

    if-nez v7, :cond_e

    const/4 v2, 0x1

    :cond_4
    :goto_0
    move-object/from16 v0, p1

    iget v0, v0, Lcom/baidu/location/c/c$a;->do:I

    move/from16 v16, v0

    if-lez v16, :cond_10

    const/16 v16, 0x1

    move/from16 v17, v16

    :goto_1
    if-eqz v10, :cond_5

    invoke-virtual {v10}, Ljava/util/LinkedHashMap;->size()I

    move-result v16

    if-gtz v16, :cond_11

    :cond_5
    const/16 v16, 0x1

    :goto_2
    if-eqz v17, :cond_13

    if-eqz v7, :cond_12

    move-object v9, v12

    move-object v11, v7

    :goto_3
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/baidu/location/c/c$a;->byte:Z

    if-eqz v12, :cond_6

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v12}, Lcom/baidu/location/c/d;->new()Lcom/baidu/location/c/e;

    move-result-object v12

    invoke-virtual {v12}, Lcom/baidu/location/c/e;->B()Z

    move-result v12

    if-eqz v12, :cond_6

    if-eqz v3, :cond_6

    if-eqz v9, :cond_6

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v12}, Lcom/baidu/location/c/d;->l()Lcom/baidu/location/c/f;

    move-result-object v12

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v13

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v12, v13, v14, v0, v1}, Lcom/baidu/location/c/f;->do(DD)Lcom/baidu/location/Address;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/baidu/location/BDLocation;->setAddr(Lcom/baidu/location/Address;)V

    :cond_6
    if-eqz v17, :cond_7

    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/baidu/location/c/c$a;->byte:Z

    if-eqz v12, :cond_7

    invoke-virtual {v11}, Lcom/baidu/location/BDLocation;->getAddrStr()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_7

    const/4 v3, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x0

    move-object v11, v15

    :cond_7
    const/4 v12, 0x0

    move-object/from16 v0, p1

    iget-boolean v13, v0, Lcom/baidu/location/c/c$a;->int:Z

    if-nez v13, :cond_8

    move-object/from16 v0, p1

    iget-boolean v13, v0, Lcom/baidu/location/c/c$a;->char:Z

    if-eqz v13, :cond_16

    :cond_8
    if-eqz v3, :cond_16

    if-eqz v9, :cond_16

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/baidu/location/c/a;->o:Lcom/baidu/location/c/d;

    invoke-virtual {v12}, Lcom/baidu/location/c/d;->l()Lcom/baidu/location/c/f;

    move-result-object v12

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v13

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v12, v13, v14, v0, v1}, Lcom/baidu/location/c/f;->if(DD)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, p1

    iget-boolean v9, v0, Lcom/baidu/location/c/c$a;->int:Z

    if-eqz v9, :cond_9

    invoke-virtual {v11, v3}, Lcom/baidu/location/BDLocation;->setPoiList(Ljava/util/List;)V

    :cond_9
    move-object v9, v3

    :goto_4
    if-eqz v17, :cond_15

    move-object/from16 v0, p1

    iget-boolean v3, v0, Lcom/baidu/location/c/c$a;->int:Z

    if-eqz v3, :cond_15

    if-eqz v9, :cond_a

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v3

    if-gtz v3, :cond_15

    :cond_a
    const/4 v2, 0x0

    move v3, v2

    move-object v11, v15

    :goto_5
    const/4 v2, 0x0

    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/baidu/location/c/c$a;->char:Z

    if-eqz v12, :cond_b

    if-eqz v9, :cond_b

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    if-lez v12, :cond_b

    sget-object v12, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    const-string v13, "\u5728%s\u9644\u8fd1"

    const/4 v2, 0x1

    new-array v14, v2, [Ljava/lang/Object;

    const/16 v16, 0x0

    const/4 v2, 0x0

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/baidu/location/Poi;

    invoke-virtual {v2}, Lcom/baidu/location/Poi;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v14, v16

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Lcom/baidu/location/BDLocation;->setLocationDescribe(Ljava/lang/String;)V

    :cond_b
    if-eqz v17, :cond_c

    move-object/from16 v0, p1

    iget-boolean v9, v0, Lcom/baidu/location/c/c$a;->char:Z

    if-eqz v9, :cond_c

    if-nez v2, :cond_c

    const/4 v3, 0x0

    move-object v11, v15

    :cond_c
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v9, 0x0

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/baidu/location/c/c$a;->else:Ljava/lang/String;

    if-eqz v12, :cond_d

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/baidu/location/c/c$a;->else:Ljava/lang/String;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-object/from16 v0, p1

    invoke-static {v7, v6, v0}, Lcom/baidu/location/c/c;->if(Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Lcom/baidu/location/c/c$a;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-static {v11, v3}, Lcom/baidu/location/c/c;->if(Lcom/baidu/location/BDLocation;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_d
    new-instance v2, Lcom/baidu/location/c/a$1;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v10}, Lcom/baidu/location/c/a$1;-><init>(Lcom/baidu/location/c/a;Ljava/lang/String;Ljava/lang/Long;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Lcom/baidu/location/BDLocation;Ljava/lang/String;Ljava/util/LinkedHashMap;)V

    invoke-virtual {v2}, Lcom/baidu/location/c/a$1;->start()V

    :goto_6
    invoke-static {v11}, Lcom/baidu/location/c/c;->if(Lcom/baidu/location/BDLocation;)Landroid/database/Cursor;

    move-result-object v2

    return-object v2

    :cond_e
    if-nez v6, :cond_f

    if-eqz v7, :cond_f

    const/4 v2, 0x2

    goto/16 :goto_0

    :cond_f
    if-eqz v6, :cond_4

    if-eqz v7, :cond_4

    const/4 v2, 0x4

    goto/16 :goto_0

    :cond_10
    const/16 v16, 0x0

    move/from16 v17, v16

    goto/16 :goto_1

    :cond_11
    const/16 v16, 0x0

    goto/16 :goto_2

    :cond_12
    if-eqz v16, :cond_17

    if-eqz v6, :cond_17

    move-object v3, v9

    move-object v11, v6

    move-object v9, v13

    goto/16 :goto_3

    :cond_13
    if-eqz v7, :cond_14

    move-object v9, v12

    move-object v11, v7

    goto/16 :goto_3

    :cond_14
    if-eqz v6, :cond_17

    move-object v3, v9

    move-object v11, v6

    move-object v9, v13

    goto/16 :goto_3

    :cond_15
    move v3, v2

    goto/16 :goto_5

    :cond_16
    move-object v9, v12

    goto/16 :goto_4

    :cond_17
    move-object v3, v11

    move-object v9, v14

    move-object v11, v15

    goto/16 :goto_3

    :cond_18
    move-object v11, v15

    goto :goto_6
.end method

.method if()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/baidu/location/c/a;->byte:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method
