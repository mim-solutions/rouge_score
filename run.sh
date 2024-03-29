# Copyright 2022 The Google Research Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
set -e
set -x

virtualenv -p python3 .
source ./bin/activate

pip install -r rouge_score/requirements.txt


python -c "import nltk; nltk.download('punkt')"
python -m rouge_score.io_test
python -m rouge_score.rouge_scorer_test
python -m rouge_score.scoring_test
python -m rouge_score.tokenize_lib_test
python -m rouge_score.tokenizers_test
