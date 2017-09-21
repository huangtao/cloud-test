.class public Lcom/boyaa/app/common/RequestResult;
.super Ljava/lang/Object;
.source "RequestResult.java"


# static fields
.field public static final REQUEST_RESULT_ERROR:I = -0x1

.field public static final REQUEST_SUCCESS:I = 0x1

.field public static final REQUEST_TIMEOUT:I


# instance fields
.field public code:I

.field public retStr:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x1

    iput v0, p0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 2
    return-void
.end method
