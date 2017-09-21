.class public final enum Lcom/boyaa/godsdk/core/PluginType;
.super Ljava/lang/Enum;
.source "PluginType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/godsdk/core/PluginType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum ANALYTICS:Lcom/boyaa/godsdk/core/PluginType;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum IAP:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum INVITE:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum LOCATION:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum PUSH:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum SDK:Lcom/boyaa/godsdk/core/PluginType;

.field public static final enum SHARE:Lcom/boyaa/godsdk/core/PluginType;


# instance fields
.field private mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 4
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "SDK"

    .line 7
    invoke-direct {v0, v1, v4, v4}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->SDK:Lcom/boyaa/godsdk/core/PluginType;

    .line 8
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "ACCOUNT"

    .line 11
    invoke-direct {v0, v1, v5, v5}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 12
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "IAP"

    .line 15
    invoke-direct {v0, v1, v6, v6}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    .line 16
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "PUSH"

    const/4 v2, 0x3

    .line 19
    invoke-direct {v0, v1, v2, v7}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->PUSH:Lcom/boyaa/godsdk/core/PluginType;

    .line 20
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "ANALYTICS"

    .line 23
    invoke-direct {v0, v1, v7, v8}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->ANALYTICS:Lcom/boyaa/godsdk/core/PluginType;

    .line 24
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "ADVERTISEMENT"

    const/4 v2, 0x5

    .line 27
    const/16 v3, 0x10

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    .line 28
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "ACTIVITYCENTER"

    const/4 v2, 0x6

    .line 31
    const/16 v3, 0x20

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    .line 32
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "SHARE"

    const/4 v2, 0x7

    .line 35
    const/16 v3, 0x40

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    .line 36
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "INVITE"

    .line 39
    const/16 v2, 0x80

    invoke-direct {v0, v1, v8, v2}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    .line 40
    new-instance v0, Lcom/boyaa/godsdk/core/PluginType;

    const-string v1, "LOCATION"

    const/16 v2, 0x9

    .line 43
    const/16 v3, 0x100

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/PluginType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    .line 3
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/boyaa/godsdk/core/PluginType;

    sget-object v1, Lcom/boyaa/godsdk/core/PluginType;->SDK:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v1, v0, v6

    const/4 v1, 0x3

    sget-object v2, Lcom/boyaa/godsdk/core/PluginType;->PUSH:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v2, v0, v1

    sget-object v1, Lcom/boyaa/godsdk/core/PluginType;->ANALYTICS:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v2, v0, v1

    sget-object v1, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v1, v0, v8

    const/16 v1, 0x9

    sget-object v2, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/boyaa/godsdk/core/PluginType;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/PluginType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "type"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 48
    iput p3, p0, Lcom/boyaa/godsdk/core/PluginType;->mType:I

    .line 49
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/godsdk/core/PluginType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/godsdk/core/PluginType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/PluginType;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/godsdk/core/PluginType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/boyaa/godsdk/core/PluginType;->mType:I

    return v0
.end method

.method public getTypeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/PluginType;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
