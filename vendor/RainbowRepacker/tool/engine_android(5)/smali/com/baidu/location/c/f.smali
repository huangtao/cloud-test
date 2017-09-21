.class final Lcom/baidu/location/c/f;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/baidu/location/b/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/baidu/location/c/f$b;,
        Lcom/baidu/location/c/f$a;
    }
.end annotation


# static fields
.field static final a0:I = 0x1e

.field static final a1:I = 0x6

.field private static final a2:D = 90.0

.field private static final a3:D = 180.0

.field private static final a5:D = -90.0

.field private static final a6:D = -180.0

.field static final aV:Ljava/lang/String; = "rgc"

.field private static final aY:[D

.field private static final aZ:Ljava/lang/String; = "0123456789bcdefghjkmnpqrstuvwxyz"


# instance fields
.field private final a4:I

.field private final a7:Landroid/database/sqlite/SQLiteDatabase;

.field private aU:I

.field private final aW:Lcom/baidu/location/c/d;

.field private aX:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lcom/baidu/location/c/f;->aY:[D

    return-void

    nop

    :array_0
    .array-data 8
        0x4046800000000000L    # 45.0
        0x4060e00000000000L    # 135.0
        0x406c200000000000L    # 225.0
        0x4073b00000000000L    # 315.0
    .end array-data
.end method

.method constructor <init>(Lcom/baidu/location/c/d;Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 2

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/baidu/location/c/f;->aW:Lcom/baidu/location/c/d;

    iput v0, p0, Lcom/baidu/location/c/f;->aX:I

    iput v0, p0, Lcom/baidu/location/c/f;->aU:I

    iput-object p2, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    iput p3, p0, Lcom/baidu/location/c/f;->a4:I

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS RGCAREA(gridkey VARCHAR(10) PRIMARY KEY, country VARCHAR(100),countrycode VARCHAR(100), province VARCHAR(100), city VARCHAR(100), citycode VARCHAR(100), district VARCHAR(100), timestamp INTEGER, version VARCHAR(50))"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS RGCROAD(_id INTEGER PRIMARY KEY AUTOINCREMENT, gridkey VARCHAR(10), street VARCHAR(100), x1 DOUBLE, y1 DOUBLE, x2 DOUBLE, y2 DOUBLE)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS RGCSITE(_id INTEGER PRIMARY KEY AUTOINCREMENT, gridkey VARCHAR(10), street VARCHAR(100), streetnumber VARCHAR(100), x DOUBLE, y DOUBLE)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS RGCPOI(pid VARCHAR(50) PRIMARY KEY , gridkey VARCHAR(10), name VARCHAR(100), type VARCHAR(50), x DOUBLE, y DOUBLE, rank INTEGER)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS RGCUPDATE(gridkey VARCHAR(10), version VARCHAR(50), type INTEGER, timestamp INTEGER, PRIMARY KEY(gridkey, type))"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static synthetic G()[D
    .locals 1

    sget-object v0, Lcom/baidu/location/c/f;->aY:[D

    return-object v0
.end method

.method static synthetic do(IDD)Ljava/lang/String;
    .locals 1

    invoke-static {p0, p1, p2, p3, p4}, Lcom/baidu/location/c/f;->if(IDD)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic do(DDDD)[D
    .locals 1

    invoke-static/range {p0 .. p7}, Lcom/baidu/location/c/f;->for(DDDD)[D

    move-result-object v0

    return-object v0
.end method

.method private static for(DDDD)[D
    .locals 15

    const/4 v0, 0x2

    new-array v0, v0, [D

    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static/range {p6 .. p7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    const-wide v7, 0x415854a640000000L    # 6378137.0

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    div-double v11, p4, v7

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    mul-double/2addr v9, v11

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    div-double v13, p4, v7

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    add-double/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->asin(D)D

    move-result-wide v9

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    div-double v11, p4, v7

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    mul-double/2addr v5, v11

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    mul-double/2addr v5, v11

    div-double v7, p4, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    mul-double/2addr v1, v11

    sub-double v1, v7, v1

    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v1

    add-double/2addr v1, v3

    const/4 v3, 0x0

    invoke-static {v9, v10}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v4

    aput-wide v4, v0, v3

    const/4 v3, 0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v1

    aput-wide v1, v0, v3

    return-object v0
.end method

.method private if(DDDDDD)D
    .locals 8

    sub-double v0, p9, p5

    sub-double v2, p1, p5

    mul-double/2addr v0, v2

    sub-double v2, p11, p7

    sub-double v4, p3, p7

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_0

    sub-double v0, p1, p5

    sub-double v2, p1, p5

    mul-double/2addr v0, v2

    sub-double v2, p3, p7

    sub-double v4, p3, p7

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    sub-double v2, p9, p5

    sub-double v4, p9, p5

    mul-double/2addr v2, v4

    sub-double v4, p11, p7

    sub-double v6, p11, p7

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    cmpl-double v4, v0, v2

    if-ltz v4, :cond_1

    sub-double v0, p1, p9

    sub-double v2, p1, p9

    mul-double/2addr v0, v2

    sub-double v2, p3, p11

    sub-double v4, p3, p11

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    goto :goto_0

    :cond_1
    div-double/2addr v0, v2

    sub-double v2, p9, p5

    mul-double/2addr v2, v0

    add-double/2addr v2, p5

    sub-double v4, p11, p7

    mul-double/2addr v0, v4

    add-double/2addr v0, p7

    sub-double v4, p1, v2

    sub-double v2, p1, v2

    mul-double/2addr v2, v4

    sub-double v4, v0, p3

    sub-double/2addr v0, p3

    mul-double/2addr v0, v4

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    goto :goto_0
.end method

.method private static if(II)I
    .locals 5

    const/16 v0, 0x64

    if-le v0, p1, :cond_0

    const-wide v1, -0x4046666666666666L    # -0.1

    const v0, 0xea60

    :goto_0
    int-to-double v3, p1

    mul-double/2addr v1, v3

    int-to-double v3, v0

    add-double v0, v1, v3

    double-to-int v0, v0

    add-int/2addr v0, p0

    return v0

    :cond_0
    const/16 v0, 0x1f4

    if-le v0, p1, :cond_1

    const-wide/high16 v1, -0x4018000000000000L    # -0.75

    const v0, 0xd8cc

    goto :goto_0

    :cond_1
    const-wide/high16 v1, -0x4020000000000000L    # -0.5

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static if(IDD)Ljava/lang/String;
    .locals 15

    const/4 v8, 0x0

    const/4 v7, 0x1

    mul-int/lit8 v9, p0, 0x5

    add-int/lit8 v0, p0, 0x1

    new-array v10, v0, [C

    new-instance v0, Lcom/baidu/location/c/f$a;

    const-wide v1, 0x4056800000000000L    # 90.0

    const-wide v3, -0x3fa9800000000000L    # -90.0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/baidu/location/c/f$a;-><init>(DDLcom/baidu/location/c/f$1;)V

    new-instance v1, Lcom/baidu/location/c/f$a;

    const-wide v2, 0x4066800000000000L    # 180.0

    const-wide v4, -0x3f99800000000000L    # -180.0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/baidu/location/c/f$a;-><init>(DDLcom/baidu/location/c/f$1;)V

    const/4 v2, 0x1

    move v6, v2

    move v5, v8

    :goto_0
    if-gt v6, v9, :cond_3

    if-eqz v7, :cond_0

    move-object v2, v1

    move-wide/from16 v3, p1

    :goto_1
    invoke-static {v2}, Lcom/baidu/location/c/f$a;->if(Lcom/baidu/location/c/f$a;)D

    move-result-wide v11

    invoke-static {v2}, Lcom/baidu/location/c/f$a;->a(Lcom/baidu/location/c/f$a;)D

    move-result-wide v13

    add-double/2addr v11, v13

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    div-double/2addr v11, v13

    shl-int/lit8 v5, v5, 0x1

    const-wide v13, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v3, v13

    double-to-int v3, v3

    const-wide v13, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v13, v11

    double-to-int v4, v13

    if-le v3, v4, :cond_1

    invoke-static {v2, v11, v12}, Lcom/baidu/location/c/f$a;->if(Lcom/baidu/location/c/f$a;D)D

    or-int/lit8 v2, v5, 0x1

    :goto_2
    rem-int/lit8 v3, v6, 0x5

    if-nez v3, :cond_5

    div-int/lit8 v3, v6, 0x5

    add-int/lit8 v3, v3, -0x1

    const-string v4, "0123456789bcdefghjkmnpqrstuvwxyz"

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    aput-char v2, v10, v3

    const/4 v4, 0x0

    :goto_3
    if-nez v7, :cond_2

    const/4 v2, 0x1

    :goto_4
    add-int/lit8 v3, v6, 0x1

    move v6, v3

    move v7, v2

    move v5, v4

    goto :goto_0

    :cond_0
    move-object v2, v0

    move-wide/from16 v3, p3

    goto :goto_1

    :cond_1
    invoke-static {v2, v11, v12}, Lcom/baidu/location/c/f$a;->a(Lcom/baidu/location/c/f$a;D)D

    move v2, v5

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    goto :goto_4

    :cond_3
    const/4 v0, 0x0

    aput-char v0, v10, p0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v0, 0x0

    :goto_5
    if-ge v0, p0, :cond_4

    aget-char v2, v10, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_5
    move v4, v2

    goto :goto_3
.end method

.method private int(DDDD)D
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


# virtual methods
.method F()Z
    .locals 6

    const/4 v3, -0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/baidu/location/c/f;->aW:Lcom/baidu/location/c/d;

    invoke-virtual {v2}, Lcom/baidu/location/c/d;->new()Lcom/baidu/location/c/e;

    move-result-object v2

    invoke-virtual {v2}, Lcom/baidu/location/c/e;->B()Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/baidu/location/c/f;->aU:I

    if-ne v2, v3, :cond_1

    iget v2, p0, Lcom/baidu/location/c/f;->aX:I

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_1

    :try_start_0
    iget-object v2, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "SELECT COUNT(*) FROM RGCSITE;"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, p0, Lcom/baidu/location/c/f;->aU:I

    iget-object v3, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "SELECT COUNT(*) FROM RGCAREA;"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, p0, Lcom/baidu/location/c/f;->aX:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v2, :cond_0

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    :cond_1
    :goto_1
    iget v1, p0, Lcom/baidu/location/c/f;->aU:I

    if-nez v1, :cond_2

    iget v1, p0, Lcom/baidu/location/c/f;->aX:I

    if-nez v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    :catch_0
    move-exception v2

    move-object v2, v1

    :goto_2
    if-eqz v2, :cond_3

    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    :cond_3
    :goto_3
    if-eqz v1, :cond_1

    :try_start_5
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v2, v1

    :goto_4
    if-eqz v2, :cond_4

    :try_start_6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    :cond_4
    :goto_5
    if-eqz v1, :cond_5

    :try_start_7
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    :cond_5
    :goto_6
    throw v0

    :catch_2
    move-exception v2

    goto :goto_0

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v2

    goto :goto_3

    :catch_5
    move-exception v2

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_6

    :catchall_1
    move-exception v0

    goto :goto_4

    :catch_7
    move-exception v3

    goto :goto_2
.end method

.method H()Lorg/json/JSONObject;
    .locals 17

    const/4 v3, 0x0

    const/4 v2, 0x0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/32 v9, 0x5265c00

    div-long/2addr v7, v9

    long-to-int v4, v7

    const-string v7, "SELECT * FROM RGCUPDATE WHERE type=%d AND %d > timestamp+%d ORDER BY gridkey"

    const-string v8, "UPDATE RGCUPDATE SET timestamp=timestamp+1 WHERE type = %d AND gridkey IN (%s)"

    :try_start_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v9, :cond_c

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v9

    if-eqz v9, :cond_c

    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/baidu/location/c/f;->aW:Lcom/baidu/location/c/d;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/baidu/location/c/d;->new()Lcom/baidu/location/c/e;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/baidu/location/c/e;->u()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v14, v15

    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/baidu/location/c/f;->aW:Lcom/baidu/location/c/d;

    invoke-virtual {v15}, Lcom/baidu/location/c/d;->new()Lcom/baidu/location/c/e;

    move-result-object v15

    invoke-virtual {v15}, Lcom/baidu/location/c/e;->D()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v4

    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-virtual {v13, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_5

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_4

    const/4 v7, 0x0

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v13, 0x1

    invoke-interface {v2, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v4, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v13

    if-lez v13, :cond_0

    const-string v13, ","

    invoke-virtual {v6, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_0
    const-string v13, "\""

    invoke-virtual {v6, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v13, "\""

    invoke-virtual {v7, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v4

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    :cond_2
    :goto_2
    const-string v2, "poi"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "addr"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v1, 0x0

    :cond_3
    return-object v1

    :cond_4
    :try_start_3
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    const/4 v4, 0x0

    :goto_3
    array-length v13, v7

    if-ge v4, v13, :cond_5

    aget-object v13, v7, v4

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_5
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_a

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    :goto_4
    invoke-interface {v3}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_9

    const/4 v7, 0x0

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v13, 0x1

    invoke-interface {v3, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v4, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v13

    if-lez v13, :cond_6

    const-string v13, ","

    invoke-virtual {v5, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_6
    const-string v13, "\""

    invoke-virtual {v5, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v13, "\""

    invoke-virtual {v7, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v1

    if-eqz v2, :cond_7

    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    :cond_7
    :goto_5
    if-eqz v3, :cond_8

    :try_start_5
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    :cond_8
    :goto_6
    throw v1

    :cond_9
    :try_start_6
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    const/4 v4, 0x0

    :goto_7
    array-length v13, v7

    if-ge v4, v13, :cond_a

    aget-object v13, v7, v4

    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_a
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-eqz v4, :cond_b

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "gk"

    invoke-virtual {v4, v7, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "ver"

    invoke-virtual {v4, v7, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "addr"

    invoke-virtual {v1, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_b
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-eqz v4, :cond_c

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "gk"

    invoke-virtual {v4, v7, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "ver"

    invoke-virtual {v4, v7, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "poi"

    invoke-virtual {v1, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_c
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_d

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v9

    const/4 v9, 0x1

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v7, v9

    invoke-static {v4, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_d
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_e

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v7

    invoke-static {v4, v8, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_e
    if-eqz v2, :cond_f

    :try_start_7
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    :cond_f
    :goto_8
    if-eqz v3, :cond_2

    :try_start_8
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_2

    :catch_1
    move-exception v2

    goto/16 :goto_2

    :catch_2
    move-exception v2

    goto :goto_8

    :catch_3
    move-exception v2

    goto/16 :goto_1

    :catch_4
    move-exception v2

    goto/16 :goto_2

    :catch_5
    move-exception v2

    goto/16 :goto_5

    :catch_6
    move-exception v2

    goto/16 :goto_6
.end method

.method do(DD)Lcom/baidu/location/Address;
    .locals 31

    const/16 v24, 0x0

    const/16 v23, 0x0

    const/16 v22, 0x0

    const/16 v21, 0x0

    const/16 v20, 0x0

    const/16 v25, 0x0

    const/4 v12, 0x0

    const/4 v11, 0x0

    const/4 v10, 0x0

    :try_start_0
    sget-object v4, Lcom/baidu/location/c/f$b;->goto:Lcom/baidu/location/c/f$b;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/baidu/location/c/f;->a4:I

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    invoke-static/range {v4 .. v9}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;IDD)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v13

    :try_start_1
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_13
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    move-result v4

    if-eqz v4, :cond_16

    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    move-wide/from16 v16, v4

    move-object v14, v11

    move-object v15, v12

    :goto_0
    :try_start_2
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x2

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/4 v4, 0x3

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    const/4 v4, 0x5

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v9

    const/4 v4, 0x4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v11

    move-object/from16 v4, p0

    move-wide/from16 v5, p3

    move-wide/from16 v7, p1

    invoke-direct/range {v4 .. v12}, Lcom/baidu/location/c/f;->int(DDDD)D

    move-result-wide v6

    cmpg-double v4, v6, v16

    if-gez v4, :cond_15

    sget-object v4, Lcom/baidu/location/c/f$b;->goto:Lcom/baidu/location/c/f$b;

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_15
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    move-result v4

    int-to-double v4, v4

    cmpg-double v4, v6, v4

    if-gtz v4, :cond_15

    move-object/from16 v4, v18

    move-object/from16 v5, v19

    :goto_1
    :try_start_3
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_14
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    move-wide/from16 v16, v6

    move-object v14, v4

    move-object v15, v5

    goto :goto_0

    :cond_0
    move-object v5, v14

    move-object v6, v15

    :goto_2
    if-eqz v13, :cond_14

    :try_start_4
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-object/from16 v17, v5

    move-object v10, v6

    :goto_3
    if-nez v17, :cond_3

    const/4 v11, 0x0

    :try_start_5
    sget-object v4, Lcom/baidu/location/c/f$b;->do:Lcom/baidu/location/c/f$b;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/baidu/location/c/f;->a4:I

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    invoke-static/range {v4 .. v9}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;IDD)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-object v18

    :try_start_6
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_13

    const-wide v26, 0x7fefffffffffffffL    # Double.MAX_VALUE

    const-string v4, "wgs842mc"

    move-wide/from16 v0, p1

    move-wide/from16 v2, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/baidu/location/Jni;->if(DDLjava/lang/String;)[D
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_11
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result-object v29

    move-object/from16 v19, v10

    :goto_4
    :try_start_7
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v4, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v28

    const/4 v4, 0x3

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    const/4 v6, 0x4

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v6

    const-string v8, "wgs842mc"

    invoke-static {v4, v5, v6, v7, v8}, Lcom/baidu/location/Jni;->if(DDLjava/lang/String;)[D

    move-result-object v4

    const/4 v5, 0x5

    move-object/from16 v0, v18

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v5

    const/4 v7, 0x6

    move-object/from16 v0, v18

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v7

    const-string v9, "wgs842mc"

    invoke-static {v5, v6, v7, v8, v9}, Lcom/baidu/location/Jni;->if(DDLjava/lang/String;)[D

    move-result-object v15

    const/4 v5, 0x0

    aget-wide v5, v29, v5

    const/4 v7, 0x1

    aget-wide v7, v29, v7

    const/4 v9, 0x0

    aget-wide v9, v4, v9

    const/4 v11, 0x1

    aget-wide v11, v4, v11

    const/4 v4, 0x0

    aget-wide v13, v15, v4

    const/4 v4, 0x1

    aget-wide v15, v15, v4

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v16}, Lcom/baidu/location/c/f;->if(DDDDDD)D

    move-result-wide v4

    cmpg-double v6, v4, v26

    if-gez v6, :cond_12

    sget-object v6, Lcom/baidu/location/c/f$b;->do:Lcom/baidu/location/c/f$b;

    invoke-static {v6}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_12
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    move-result v6

    int-to-double v6, v6

    cmpg-double v6, v4, v6

    if-gtz v6, :cond_12

    move-object/from16 v10, v28

    :goto_5
    :try_start_8
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_11
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    move-wide/from16 v26, v4

    move-object/from16 v19, v10

    goto :goto_4

    :catch_0
    move-exception v4

    move-object/from16 v17, v5

    move-object v10, v6

    goto/16 :goto_3

    :catch_1
    move-exception v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    :goto_6
    if-eqz v4, :cond_14

    :try_start_9
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    move-object/from16 v17, v5

    move-object v10, v6

    goto/16 :goto_3

    :catch_2
    move-exception v4

    move-object/from16 v17, v5

    move-object v10, v6

    goto/16 :goto_3

    :catchall_0
    move-exception v4

    move-object v13, v10

    :goto_7
    if-eqz v13, :cond_1

    :try_start_a
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    :cond_1
    :goto_8
    throw v4

    :cond_2
    move-object/from16 v4, v19

    :goto_9
    if-eqz v18, :cond_11

    :try_start_b
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    move-object v10, v4

    :cond_3
    :goto_a
    sget-object v4, Lcom/baidu/location/c/f$b;->a:Lcom/baidu/location/c/f$b;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/baidu/location/c/f;->a4:I

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    invoke-static/range {v4 .. v9}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;IDD)Ljava/lang/String;

    move-result-object v5

    const/4 v4, 0x0

    :try_start_c
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    move-result-object v4

    :try_start_d
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_10

    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    if-nez v5, :cond_10

    const-string v5, "country"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    move-result-object v9

    :try_start_e
    const-string v5, "countrycode"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_c
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    move-result-object v8

    :try_start_f
    const-string v5, "province"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_d
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    move-result-object v7

    :try_start_10
    const-string v5, "city"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_e
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    move-result-object v6

    :try_start_11
    const-string v5, "citycode"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_f
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    move-result-object v5

    :try_start_12
    const-string v11, "district"

    invoke-interface {v4, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    invoke-interface {v4, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_10
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    move-result-object v25

    move-object v11, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object/from16 v5, v25

    :goto_b
    if-eqz v4, :cond_4

    :try_start_13
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_a

    :cond_4
    :goto_c
    if-eqz v11, :cond_5

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    invoke-static {v11}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v11

    invoke-direct {v4, v11}, Ljava/lang/String;-><init>([B)V

    move-object v11, v4

    :cond_5
    if-eqz v9, :cond_6

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    invoke-static {v9}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/lang/String;-><init>([B)V

    move-object v9, v4

    :cond_6
    if-eqz v8, :cond_7

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-static {v8}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/lang/String;-><init>([B)V

    move-object v8, v4

    :cond_7
    if-eqz v7, :cond_8

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-static {v7}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/lang/String;-><init>([B)V

    move-object v7, v4

    :cond_8
    if-eqz v6, :cond_9

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-static {v6}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/String;-><init>([B)V

    move-object v6, v4

    :cond_9
    if-eqz v5, :cond_a

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    move-object v5, v4

    :cond_a
    if-eqz v10, :cond_b

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-static {v10}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/lang/String;-><init>([B)V

    move-object v10, v4

    :cond_b
    if-eqz v17, :cond_e

    new-instance v4, Ljava/lang/String;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-static {v12}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v12

    invoke-direct {v4, v12}, Ljava/lang/String;-><init>([B)V

    :goto_d
    new-instance v12, Lcom/baidu/location/Address$Builder;

    invoke-direct {v12}, Lcom/baidu/location/Address$Builder;-><init>()V

    invoke-virtual {v12, v11}, Lcom/baidu/location/Address$Builder;->country(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v11

    invoke-virtual {v11, v9}, Lcom/baidu/location/Address$Builder;->countryCode(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/baidu/location/Address$Builder;->province(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/baidu/location/Address$Builder;->city(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/baidu/location/Address$Builder;->cityCode(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/baidu/location/Address$Builder;->district(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/baidu/location/Address$Builder;->street(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/baidu/location/Address$Builder;->streetNumber(Ljava/lang/String;)Lcom/baidu/location/Address$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/baidu/location/Address$Builder;->build()Lcom/baidu/location/Address;

    move-result-object v4

    return-object v4

    :catch_3
    move-exception v5

    move-object v10, v4

    goto/16 :goto_a

    :catch_4
    move-exception v4

    move-object v5, v11

    move-object v4, v10

    :goto_e
    if-eqz v5, :cond_11

    :try_start_14
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_5

    move-object v10, v4

    goto/16 :goto_a

    :catch_5
    move-exception v5

    move-object v10, v4

    goto/16 :goto_a

    :catchall_1
    move-exception v4

    move-object/from16 v18, v11

    :goto_f
    if-eqz v18, :cond_c

    :try_start_15
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_9

    :cond_c
    :goto_10
    throw v4

    :catch_6
    move-exception v5

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v7, v22

    move-object/from16 v8, v23

    move-object/from16 v9, v24

    :goto_11
    if-eqz v4, :cond_f

    :try_start_16
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_7

    move-object v11, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object/from16 v5, v25

    goto/16 :goto_c

    :catch_7
    move-exception v4

    move-object v11, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object/from16 v5, v25

    goto/16 :goto_c

    :catchall_2
    move-exception v5

    move-object/from16 v30, v5

    move-object v5, v4

    move-object/from16 v4, v30

    :goto_12
    if-eqz v5, :cond_d

    :try_start_17
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_b

    :cond_d
    :goto_13
    throw v4

    :catch_8
    move-exception v5

    goto/16 :goto_8

    :catch_9
    move-exception v5

    goto :goto_10

    :catch_a
    move-exception v4

    goto/16 :goto_c

    :catch_b
    move-exception v5

    goto :goto_13

    :catchall_3
    move-exception v5

    move-object/from16 v30, v5

    move-object v5, v4

    move-object/from16 v4, v30

    goto :goto_12

    :catch_c
    move-exception v5

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v7, v22

    move-object/from16 v8, v23

    goto :goto_11

    :catch_d
    move-exception v5

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v7, v22

    goto :goto_11

    :catch_e
    move-exception v5

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    goto :goto_11

    :catch_f
    move-exception v5

    move-object/from16 v5, v20

    goto :goto_11

    :catch_10
    move-exception v11

    goto :goto_11

    :catchall_4
    move-exception v4

    goto :goto_f

    :catch_11
    move-exception v4

    move-object/from16 v5, v18

    move-object v4, v10

    goto :goto_e

    :catch_12
    move-exception v4

    move-object/from16 v5, v18

    move-object/from16 v4, v19

    goto :goto_e

    :catchall_5
    move-exception v4

    goto/16 :goto_7

    :catch_13
    move-exception v4

    move-object v4, v13

    move-object v5, v11

    move-object v6, v12

    goto/16 :goto_6

    :catch_14
    move-exception v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v13

    goto/16 :goto_6

    :catch_15
    move-exception v4

    move-object v4, v13

    move-object v5, v14

    move-object v6, v15

    goto/16 :goto_6

    :cond_e
    move-object/from16 v4, v17

    goto/16 :goto_d

    :cond_f
    move-object v11, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object/from16 v5, v25

    goto/16 :goto_c

    :cond_10
    move-object/from16 v5, v25

    move-object/from16 v6, v20

    move-object/from16 v7, v21

    move-object/from16 v8, v22

    move-object/from16 v9, v23

    move-object/from16 v11, v24

    goto/16 :goto_b

    :cond_11
    move-object v10, v4

    goto/16 :goto_a

    :cond_12
    move-wide/from16 v4, v26

    move-object/from16 v10, v19

    goto/16 :goto_5

    :cond_13
    move-object v4, v10

    goto/16 :goto_9

    :cond_14
    move-object/from16 v17, v5

    move-object v10, v6

    goto/16 :goto_3

    :cond_15
    move-wide/from16 v6, v16

    move-object v4, v14

    move-object v5, v15

    goto/16 :goto_1

    :cond_16
    move-object v5, v11

    move-object v6, v12

    goto/16 :goto_2
.end method

.method if(DD)Ljava/util/List;
    .locals 17

    const/4 v7, 0x0

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lcom/baidu/location/c/f$b;->char:Lcom/baidu/location/c/f$b;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/baidu/location/c/f;->a4:I

    move-wide/from16 v3, p1

    move-wide/from16 v5, p3

    invoke-static/range {v1 .. v6}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;IDD)Ljava/lang/String;

    move-result-object v1

    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v1, 0x0

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v1, 0x2

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/4 v1, 0x4

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v8

    const/4 v1, 0x5

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v6

    const/4 v1, 0x6

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    move-object/from16 v1, p0

    move-wide/from16 v2, p3

    move-wide/from16 v4, p1

    invoke-direct/range {v1 .. v9}, Lcom/baidu/location/c/f;->int(DDDD)D

    move-result-wide v1

    sget-object v3, Lcom/baidu/location/c/f$b;->char:Lcom/baidu/location/c/f$b;

    invoke-static {v3}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;)I

    move-result v3

    int-to-double v3, v3

    cmpg-double v3, v1, v3

    if-gez v3, :cond_0

    new-instance v3, Lcom/baidu/location/Poi;

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    new-instance v5, Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-static {v6}, Lcom/baidu/location/f/b/b;->a([B)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    const-wide/16 v6, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/baidu/location/Poi;-><init>(Ljava/lang/String;Ljava/lang/String;D)V

    double-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    move/from16 v0, v16

    invoke-static {v0, v1}, Lcom/baidu/location/c/f;->if(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v12, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v1

    move-object v1, v10

    :goto_1
    if-eqz v1, :cond_1

    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_1
    :goto_2
    invoke-interface {v12}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Lcom/baidu/location/c/f$1;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/baidu/location/c/f$1;-><init>(Lcom/baidu/location/c/f;)V

    invoke-static {v13, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    const/4 v1, 0x0

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/baidu/location/Poi;

    new-instance v2, Lcom/baidu/location/Poi;

    invoke-virtual {v1}, Lcom/baidu/location/Poi;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/baidu/location/Poi;->getName()Ljava/lang/String;

    move-result-object v1

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    invoke-direct {v2, v3, v1, v4, v5}, Lcom/baidu/location/Poi;-><init>(Ljava/lang/String;Ljava/lang/String;D)V

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v11

    :cond_3
    if-eqz v10, :cond_1

    :try_start_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_2

    :catchall_0
    move-exception v1

    move-object v10, v7

    :goto_3
    if-eqz v10, :cond_4

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :cond_4
    :goto_4
    throw v1

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v2

    goto :goto_4

    :catchall_1
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    move-object v1, v7

    goto :goto_1
.end method

.method if(Lorg/json/JSONObject;)V
    .locals 8

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    invoke-static {}, Lcom/baidu/location/c/f$b;->values()[Lcom/baidu/location/c/f$b;

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_3

    aget-object v4, v2, v1

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->if(Lcom/baidu/location/c/f$b;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, ""

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->do(Lcom/baidu/location/c/f$b;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->do(Lcom/baidu/location/c/f$b;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->if(Lcom/baidu/location/c/f$b;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/baidu/location/c/f$b;->a(Lcom/baidu/location/c/f$b;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v4}, Lcom/baidu/location/c/f$b;->for(Lcom/baidu/location/c/f$b;)I

    move-result v7

    invoke-virtual {v4, v6, v0, v7}, Lcom/baidu/location/c/f$b;->a(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v5, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    :cond_1
    :goto_2
    return-void

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/baidu/location/c/f;->aX:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/baidu/location/c/f;->aU:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v0, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    :try_start_4
    iget-object v1, p0, Lcom/baidu/location/c/f;->a7:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :goto_3
    throw v0

    :catch_2
    move-exception v1

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_2
.end method
